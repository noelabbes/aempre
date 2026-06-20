# Plan de Coexistencia e Interoperabilidad (Fase E)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable define la **Estrategia de Migración de Datos** y los **Mecanismos de Coexistencia** durante la transición de los sistemas legados hacia el nuevo ecosistema SIPBA. Establece pautas para garantizar que la migración de millones de registros telefónicos activos en el Perú se realice sin interrupción del servicio y detalla el funcionamiento híbrido durante las fases de transición.

---

## 1. Estrategia de Migración de Datos (Carga de Líneas Activas)

La base de datos transaccional de SIPBA requiere conocer el estado de las líneas actualmente operativas en el país para aplicar de forma correcta reglas críticas como el límite de 7 líneas por titular. Debido a que existen aproximadamente 40 millones de líneas móviles activas en el Perú, se rechaza la migración en frío (corte de servicio) y se implementa una estrategia de **Carga Inicial por Lotes con Sincronización Delta Continua**:

```
 [Base Datos Operadora] ------------ (Paso 1: Dump Inicial) ------------> [S3 Cifrado]
                                                                               |
                                                                       (Carga Masiva)
                                                                               |
                                                                               v
 [Base Datos Operadora] -- (Paso 2: Deltas Diarios) --> [SIPBA-ETL] --> [BD SIPBA Transaccional]
                                                           |                   |
                                                           v                   v
                                                      (Transición)       (Paso 3: Go-Live)
                                                     [Flujos Híbridos]  [Activación Real-Time]
```

### Paso 1: Extracción y Carga de Línea Base (Lote Histórico)
1.  **Corte de Línea Base:** En una fecha acordada, cada operadora móvil genera un volcado (Dump) estructurado en formato Parquet comprimido con las columnas: `msisdn`, `dni_titular`, `nombres_completos`, `imei_asociado`, `fecha_alta` y `token_distribuidor_origen`.
2.  **Transmisión Segura:** Los archivos se cargan de forma encriptada (llave provista por OSIPTEL) hacia depósitos de almacenamiento seguro **Amazon S3 / Azure Blob** dedicados para cada operadora.
3.  **Procesamiento de Ingesta:** El pipeline de datos de OSIPTEL ingesta de forma masiva los registros en la base de datos PostgreSQL Aurora, aplicando reglas de saneamiento (ej. limpieza de DNI incorrectos y eliminación de números de prueba).

### Paso 2: Periodo de Sincronización Delta (Transición)
*   Durante el periodo de desarrollo y pruebas de la plataforma (AT1 y AT2), las operadoras remiten diariamente a las 23:59:00 un archivo delta conteniendo únicamente las altas, bajas y cambios de titularidad ocurridos en las últimas 24 horas.
*   El pipeline de SIPBA procesa estos deltas de manera nocturna para mantener actualizada la base de datos de OSIPTEL con un desfase de 24 horas.

### Paso 3: Transición al Tiempo Real (Go-Live)
*   En la fecha de lanzamiento de la Fase de Activación (AT2), se detiene la importación de deltas diarios y se activan síncronamente los endpoints del API Gateway. A partir de este hito, cada nueva transacción comercial se escribe e impacta la base transaccional de SIPBA en milisegundos.

---

## 2. Mecanismos de Coexistencia de Sistemas

Durante las fases de transición (especialmente AT1 y AT2), coexistirán componentes de la infraestructura antigua basada en archivos por lotes (Batch) con el nuevo bus de eventos en tiempo real.

### 2.1. Convivencia de Listas Negras (RENTESEG Legacy vs. Kafka)
Actualmente, el sistema RENTESEG consolida una lista negra nacional que se exporta y distribuye a las operadoras una vez al día. 

Para asegurar la continuidad de los terminales que no soporten APIs de tiempo real o durante la migración de las operadoras:
*   **Emulador de Lista Batch:** El bus de eventos `SIPBA-BROKER` captura cada evento del tópico `solicitudes-bloqueo` y, en paralelo al despacho asíncrono, escribe el registro en la base de datos histórica del RENTESEG.
*   **Mantenimiento del Archivo Diario:** El sistema heredado del RENTESEG continuará generando y exportando el archivo plano de lista negra cada 24 horas. Las operadoras consumirán este archivo como mecanismo de respaldo y reconciliación de consistencia secundaria (*Fail-Safe*), en caso de que pierdan conexión con la cola de mensajería Kafka.

```
 [Evento de Bloqueo] 
         |
         +----> [Kafka: solicitudes-bloqueo] --(Tiempo Real)--> [HLR/EIR Operadora (SLA < 15m)]
         |
         +----> [Emulador RENTESEG Legacy]
                      |
                      v
                [BD RENTESEG SQL]
                      |
              (Generación Batch)
                      |
                      v
                [Log Diario SFTP] ----------(Cada 24 horas)---------> [Respaldo Operadora]
```

### 2.2. Protocolo de Contingencia por Caída de RENIEC
Si el servicio síncrono de biometría facial federada de RENIEC queda inactivo por más de 5 minutos, la regla de contingencia automática (Circuit Breaker Abierto) entra en vigor:
1.  **Modo Contingencia (Shadow Biometrics):** El API Gateway cambia el estado de la verificación biométrica de `OBLIGATORIA_ONLINE` a `DEGRADADA_OFFLINE`.
2.  **Operación del Punto de Venta:** Las operadoras capturan la huella tradicional y firma física, almacenándolas localmente. La operadora envía la solicitud al API de SIPBA sin el score biométrico síncrono, pero marcando el campo `modo_contingencia: true`.
3.  **Auditoría Posterior prioritaria:** El motor `SIPBA-CORE` aprueba temporalmente la activación para no bloquear el comercio del país. Sin embargo, estas transacciones son marcadas en base de datos con prioridad alta para auditoría física posterior por parte de la GFS y se concilian obligatoriamente en el ETL nocturno.

---

## 3. Estrategia de Pruebas y Validación (Shadow Mode)

Para certificar que el motor de reglas de SIPBA no alterará el tráfico comercial de telecomunicaciones legítimo ni generará falsos positivos (como denegar activaciones a ciudadanos con reglas mal procesadas):

*   **Fase de Modo Sombra (Shadow Mode):** Durante 30 días calendario al inicio de la fase AT2, las operadoras estarán obligadas a consumir el API `/v1/activaciones` enviando la información real del DNI y biometría.
*   **Comportamiento del Core:** `SIPBA-CORE` procesará la transacción, consultará a RENIEC y ejecutará todas las reglas (límite de líneas, bloqueos).
*   **Omisión de Denegación:** Independientemente del resultado (incluso si la biometría falla o excede las 7 líneas), SIPBA retornará un código de respuesta `APROBADA_SHADOW`.
*   **Análisis de Impacto:** Los ingenieros de OSIPTEL compararán el porcentaje de transacciones que habrían sido denegadas en modo real contra las activaciones efectivas reportadas por la operadora. Esto permitirá calibrar los umbrales del score biométrico facial y corregir inconsistencias en los datos históricos antes de habilitar el bloqueo real (Go-Live).

---
*Nota: La finalización e implementación de estos mecanismos de coexistencia y pruebas marca el cierre de los entregables de diseño de la Fase E. Con esto, el proyecto SIPBA cuenta con planos lógicos, físicos, y una estrategia clara de migración para iniciar la Fase F (Planificación de la Migración).*
