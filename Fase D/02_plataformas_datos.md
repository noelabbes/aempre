# Plataformas de Datos y Eventos (Fase D)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable define la **Arquitectura Física de Datos y Eventos** para el sistema SIPBA. Detalla la configuración de las bases de datos transaccionales, las plataformas de mensajería (event broker), los mecanismos de caché distribuida y las políticas de retención física de los datos de acuerdo al marco legal peruano.

---

## 1. Topología del Bus de Eventos (Apache Kafka)

Para la propagación asíncrona de los bloqueos de terminales y la auditoría distribuida se implementa un clúster gestionado de **Apache Kafka (AWS MSK)** desplegado en tres zonas de disponibilidad (AZ) para asegurar redundancia ante fallas de hardware en la nube.

```
                    +------------------------------------+
                    |  AWS MSK: CLÚSTER APACHE KAFKA      |
                    |                                    |
                    |   Zona A       Zona B       Zona C |
                    |  +-------+    +-------+    +-------+
                    |  |Broker1|    |Broker2|    |Broker3|
                    |  +-------+    +-------+    +-------+
                    |      \            |            /   |
                    |       \           |           /    |
                    |      [Zookeeper / Metadata Cluster]|
                    +------------------------------------+
```

### 1.1. Configuración de Alta Disponibilidad
*   **Número de Brokers:** Mínimo 3 brokers (uno por AZ). Esto evita escenarios de cerebro dividido (*split-brain*) y asegura el quórum del clúster.
*   **Factor de Replicación:** Configurado en `3` para todos los tópicos core, garantizando que el clúster tolere la pérdida completa de un broker/data center sin pérdida de mensajes.
*   **Min In-Sync Replicas:** Fijado en `2`. El Core (`SIPBA-CORE`) solo considerará un mensaje escrito con éxito cuando sea confirmado por al menos dos brokers de forma síncrona.

### 1.2. Estructura de Tópicos Transaccionales

| Tópico | Particiones | Retención | Compresión | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| `solicitudes-bloqueo` | 6 | 7 días | Zstd | Órdenes de bloqueo de IMEI e instrucción de suspensión emitidas por la PNP y orquestadas por SIPBA. |
| `activaciones-exitosas`| 6 | 3 días | Zstd | Registro de activaciones aprobadas para consumo del pipeline de reconciliación ETL nocturno. |
| `alertas-fraude` | 3 | 30 días | Gzip | Alertas generadas por comportamiento sospechoso o exceso de intentos fallidos. |

### 1.3. Seguridad del Broker
*   **Cifrado en Tránsito:** Tráfico TLS 1.2 obligatorio entre los clientes (`SIPBA-CORE`, operadoras) y los brokers.
*   **Autenticación y Autorización:** Implementada mediante credenciales **SASL/SCRAM** (encriptadas con llaves almacenadas en Secret Manager) y políticas de listas de control de acceso (ACLs) que definen estrictamente qué microservicio puede escribir o leer de cada tópico.

---

## 2. Base de Datos Transaccional (PostgreSQL Aurora)

Para el almacenamiento transaccional (titulares, estados de IMEI, auditoría de transacciones y distribuidores) se implementa **Amazon Aurora PostgreSQL**, una base de datos relacional nativa de nube en alta disponibilidad.

```
       [Peticiones de Escritura]                 [Consultas / Reportes / ETL]
                   |                                           |
                   v                                           v
       +-----------------------+                   +-----------------------+
       |   INSTANCIA PRIMARIA  |                   |  RÉPLICAS DE LECTURA  |
       |  (Escritura - AZ-A)   |                   |   (Lectura - AZ-B/C)  |
       +-----------------------+                   +-----------------------+
                   |                                           ^
                   |====== Replicación Física Asíncrona =======|
                   |       (Latencia de Almacenamiento < 10ms)
                   v
       +-------------------------------------------------------------------+
       |            ALMACENAMIENTO DE AURORA (Cifrado AES-256)             |
       |         Distribuido automáticamente en 3 Zonas de Disp.          |
       +-------------------------------------------------------------------+
```

### 2.1. Configuración de Instancias y Replicación
*   **Instancia Primaria (Writer):** Ubicada en la AZ-A de la subred aislada de datos. Procesa todas las operaciones de escritura e inserción de transacciones de activación y bloqueo.
*   **Réplicas de Lectura (Reader Nodes):** Dos instancias de réplica distribuidas en la AZ-B y AZ-C.
    *   *Balanceo de Lecturas:* El tráfico de consulta (ej. validaciones del core, consultas del ciudadano) se distribuye automáticamente entre las réplicas.
    *   *Auto-Failover:* En caso de falla en la instancia primaria, el clúster promueve automáticamente una réplica de lectura a primaria en menos de 30 segundos, sin intervención manual y manteniendo el mismo endpoint DNS.

### 2.2. Seguridad y Cifrado
*   **Cifrado de Almacenamiento (TDE):** Cifrado físico de los discos a nivel de hardware administrado por el motor mediante **AES-256**, utilizando llaves maestras custodiadas en el gestor de llaves KMS de OSIPTEL.
*   **Resguardo de Backups:** Respaldos automáticos diarios con una ventana de retención de 35 días para Recuperación en el Tiempo (PITR - *Point-in-Time Recovery*).

---

## 3. Caché Distribuida y Control de Tráfico (Redis Cluster)

Para aliviar la carga de la base de datos relacional y soportar la baja latencia requerida por el API Gateway, se despliega un clúster de **Redis** en memoria.

### 3.1. Configuración del Clúster
*   **Arquitectura:** Clúster de Redis con 3 Shards primarios, cada uno con 1 nodo de réplica (total de 6 nodos distribuidos en las AZs).
*   **Mecanismo de Persistencia:** AOF (Append Only File) activado para evitar pérdida completa de datos ante reinicios imprevistos.

### 3.2. Casos de Uso Críticos

1.  **Rate Limiting Dinámico:**
    *   Almacena contadores rápidos de peticiones por IP/Operadora. Si una operadora excede las 200 peticiones/segundo, Redis bloquea temporalmente la ruta en el API Gateway en microsegundos, sin consultar la base de datos SQL.
2.  **Lista Blanca de Distribuidores:**
    *   Mantiene en caché el catálogo de tokens UUID de los distribuidores autorizados. El core valida la autorización en Redis en menos de 2 milisegundos.
3.  **Locks Distribuidos Transaccionales:**
    *   Previene ataques de simulación rápida de SIM Swapping (carreras de concurrencia donde se solicita la activación simultánea del mismo DNI en dos puntos de venta diferentes). Redis adquiere un Lock atómico por el campo `dni` por 10 segundos, obligando a procesar las activaciones de manera estrictamente secuencial.

---

## 4. Ciclo de Vida y Retención de Datos (LPDP - Ley 29733)

El almacenamiento cumple con el marco normativo peruano de protección de datos personales y fiscalización administrativa:

### 4.1. Reglas de Retención Física

| Entidad / Datos | Almacenamiento Primario | Retención Activa | Retención Pasiva (Archivo) | Acción de Cierre |
| :--- | :--- | :--- | :--- | :--- |
| **Imágenes / Fotos Biométricas** | RAM (Exclusivo) | 0 segundos | No almacena | Scrubbing y eliminación inmediata post-RENIEC. |
| **Transacciones de Activación** | PostgreSQL Aurora | 3 años | 7 años (S3 Glaciar) | Encriptación con llave asimétrica archivada. |
| **Auditoría RENTESEG** | PostgreSQL Aurora | 5 años | 5 años (S3 Glaciar) | Encriptación histórica y purga de logs antiguos. |
| **Registros de Denuncias PNP** | PostgreSQL Aurora | 5 años | No aplica | Archivo de cumplimiento. |

### 4.2. Cumplimiento de la Privacidad (LPDP)
*   **Anonimización y Hashing:** Los logs del sistema y de auditoría nunca registran nombres en claro ni números de DNI completos. Se registran únicamente hashes SHA-256 o DNI enmascarados para evitar filtraciones de identidad digital en servidores de desarrollo o monitoreo.
*   **Auditoría Interna de Acceso:** Cada acceso de un administrador de base de datos a la tabla `Ciudadano` o tablas de transacciones es auditado y escrito en un log protegido e inalterable mediante políticas de control internas.

---
*Nota: La seguridad de acceso físico a estos datos y la resiliencia en caso de desastre total se detallan en el entregable de resiliencia y seguridad ([03_seguridad_resiliencia.md](file:///D:/aempre/Fase%20D/03_seguridad_resiliencia.md)).*
