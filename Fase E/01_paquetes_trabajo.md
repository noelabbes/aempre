# Paquetes de Trabajo y Fichas de Proyecto (Fase E)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable agrupa las brechas identificadas en la capa de negocio, datos, aplicaciones y tecnología en **Paquetes de Trabajo (Work Packages)** lógicos y autónomos. Cada paquete se estructura como un proyecto de implementación con objetivos, alcances, tecnologías y responsables definidos para facilitar la gobernanza y ejecución de la migración.

---

## 1. Mapeo de Brechas a Paquetes de Trabajo

La siguiente matriz conecta de manera directa las brechas de negocio detalladas en el [Análisis de Brechas (Fase B)](file:///D:/aempre/Fase%20B/04_gap_analysis_negocio.md) con las soluciones lógicas de la Fase C y físicas de la Fase D, asociándolas a su respectivo Paquete de Trabajo (WP):

| Brecha de Negocio | Componente Lógico (Fase C) | Componente Físico (Fase D) | Paquete de Trabajo (WP) |
| :--- | :--- | :--- | :--- |
| **Gobernanza de Reglas (G-21)** y **Venta Ambulatoria (G-26)** | `SIPBA-CORE` (Motor de Reglas) y `SIPBA-GW` (API Gateway) | Clúster Kubernetes EKS, Redis Cluster | **WP2:** Core Transaccional e Integraciones Gubernamentales |
| **Validación de Identidad en Ventas (G-22)** | Integración síncrona con API de RENIEC | Canales B2B directos (VPN / PIDE) | **WP2:** Core Transaccional e Integraciones Gubernamentales |
| **Instrucción y Ejecución de Bloqueo (G-23)** | `SIPBA-BROKER` (Event Broker Kafka) y API PNP | Clúster Kafka (AWS MSK) y endpoints mTLS | **WP3:** Integración y Homologación de Operadoras Móviles |
| **Control de Canal de Distribución (G-24)** | Whitelist y tokens de seguridad distribuidos | Almacenamiento en caché de Redis | **WP2:** Core Transaccional e Integraciones Gubernamentales |
| **Auditoría de Datos y Reconciliación (G-25)** | `SIPBA-ETL` (Pipeline Spark/Python) | BD PostgreSQL Aurora (Réplicas de lectura) | **WP4:** Analítica y Reconciliación de Fiscalización |
| **Fundación de Redes e Infraestructura (Todas)** | Seguridad perimetral, mTLS e IAM | VPC, subredes, balanceadores, AWS CloudHSM | **WP1:** Cimentación de Infraestructura y Redes |

---

## 2. Fichas de Proyectos de Implementación

A continuación se detallan las especificaciones técnicas y operativas de los cuatro paquetes de trabajo definidos para el proyecto SIPBA:

### 2.1. Ficha del Paquete: `WP1 - Cimentación de Infraestructura y Redes`

*   **Descripción:** Aprovisionamiento de la infraestructura física, entornos de nube, canales de comunicaciones de red y componentes de seguridad perimetral que servirán de base para el despliegue del software transaccional.
*   **Objetivos:**
    1.  Establecer la conectividad privada y redundante (AWS Direct Connect / VPNs IPsec) con las 4 operadoras de telefonía móvil, la PNP y RENIEC.
    2.  Implementar la VPC segmentada en tres capas (DMZ, Aplicación, Datos) con alta disponibilidad Multi-AZ.
    3.  Aprovisionar los entornos de bases de datos PostgreSQL Aurora, el clúster de caché Redis y el clúster de Kubernetes (EKS/Kubernetes).
*   **Entradas:** [Fase D: 01_infraestructura_redes.md](file:///D:/aempre/Fase%20D/01_infraestructura_redes.md), Principios de Seguridad de la Fase Preliminar.
*   **Entregables (Salidas):**
    *   Entornos en la Nube desplegados mediante infraestructura como código (scripts Terraform).
    *   Túneles VPN y enlaces Direct Connect configurados y certificados.
    *   Certificados X.509 de la PKI de OSIPTEL distribuidos a los clientes autorizados.
*   **Tecnologías:** AWS Cloud, Terraform, AWS Direct Connect, Kubernetes, mTLS.
*   **Responsables:** GTIC (Gerencia de Tecnologías de la Información) y Administradores de Redes de las Operadoras.

---

### 2.2. Ficha del Paquete: `WP2 - Core Transaccional e Integraciones Gubernamentales`

*   **Descripción:** Desarrollo del software core de procesamiento en tiempo real del SIPBA, implementando el API Gateway y el Motor de Reglas regulatorias. Incluye las llamadas síncronas hacia las bases de datos del Estado (RENIEC).
*   **Objetivos:**
    1.  Desarrollar el `SIPBA-GW` para la intercepción de llamadas, validación de firmas digitales y enmascaramiento dinámico de datos.
    2.  Construir el motor de reglas síncrono `SIPBA-CORE` para validar el límite de 7 líneas por DNI y el estado del distribuidor en tiempo real.
    3.  Integrar el cotejo biométrico facial federado con el servicio Web de RENIEC (PIDE).
*   **Entradas:** [Fase C: 02_arquitectura_aplicaciones.md](file:///D:/aempre/Fase%20C/02_arquitectura_aplicaciones.md), [Fase C: 03_integracion_sistemas.md](file:///D:/aempre/Fase%20C/03_integracion_sistemas.md).
*   **Entregables (Salidas):**
    *   Código fuente documentado del API Gateway y motor de reglas.
    *   Microservicio de orquestación integrado con RENIEC.
    *   Base de datos transaccional local inicializada con catálogos de DNI y distribuidores.
*   **Tecnologías:** Kong Enterprise (Gateway), Go / Java Spring Boot (Core Rules), Redis (Locks y Caché), REST/JSON.
*   **Responsables:** GTIC (OSIPTEL) y Equipo de Desarrollo de RENIEC.

---

### 2.3. Ficha del Paquete: `WP3 - Integración y Homologación de Operadoras Móviles`

*   **Descripción:** Coordinación técnica y desarrollo del software intermedio necesario para conectar las redes móviles y los CRMs de las operadoras al bus de eventos asíncronos del SIPBA para la recepción y ejecución automatizada de órdenes de bloqueo de IMEI y suspensión de líneas.
*   **Objetivos:**
    1.  Configurar el clúster de mensajería Apache Kafka en alta disponibilidad (AWS MSK).
    2.  Establecer los tópicos de bloqueo y alertas.
    3.  Homologar a las 4 operadoras para consumir del tópico `solicitudes-bloqueo` y aplicar las suspensiones en sus HLR/EIR en un plazo menor a 15 minutos de forma automática.
*   **Entradas:** [Fase C: 03_integracion_sistemas.md](file:///D:/aempre/Fase%20C/03_integracion_sistemas.md) (API Webhook y API de Denuncias PNP).
*   **Entregables (Salidas):**
    *   Clúster AWS MSK operativo.
    *   Conectores y Webhooks implementados en los data centers de Claro, Movistar, Entel y Bitel.
    *   Pruebas de estrés transaccional y SLA de bloqueo homologadas por OSIPTEL.
*   **Tecnologías:** Apache Kafka (AWS MSK), SASL/SCRAM, Webhooks REST, Configuración de HLR/HSS y EIR de red móvil.
*   **Responsables:** Áreas de Ingeniería de Red y Sistemas de Claro, Movistar, Entel, Bitel, y GTIC (OSIPTEL).

---

### 2.4. Ficha del Paquete: `WP4 - Analítica y Reconciliación de Fiscalización`

*   **Descripción:** Desarrollo del pipeline batch fuera de línea encargado de cruzar los registros de activación declarados diariamente por las operadoras contra las transacciones aprobadas por SIPBA, para gatillar suspensiones automáticas por inconsistencia y abrir expedientes administrativos.
*   **Objetivos:**
    1.  Implementar la ingesta y descompresión de logs comerciales de ventas remitidos por las operadoras a las 23:59.
    2.  Diseñar el pipeline Apache Spark que calcula la fórmula de reconciliación contra la base relacional de SIPBA.
    3.  Construir la consola de control y visualización de KPIs para los fiscalizadores de la GFS.
*   **Entradas:** [Fase C: 01_arquitectura_datos.md](file:///D:/aempre/Fase%20C/01_arquitectura_datos.md) (Sección de Reconciliación Diaria).
*   **Entregables (Salidas):**
    *   Scripts Spark/Python parametrizados para ejecución automática.
    *   Tableros de control en Grafana / Apache Superset que muestran el ranking de riesgo de distribuidores y tasa de discrepancia por operadora.
    *   Base de datos analítica consolidada y conectores con el sistema de fiscalización.
*   **Tecnologías:** Apache Spark, Python (Polars/Pandas), PostgreSQL (Réplicas de lectura), Apache Airflow, Grafana.
*   **Responsables:** GTIC y GFS (Gerencia de Supervisión y Fiscalización) de OSIPTEL.

---

## 3. Matriz de Priorización (Valor vs. Esfuerzo)

Para definir la secuencia óptima del plan de migración, se evalúa cada Paquete de Trabajo considerando su **Valor para el Negocio** (reducción del fraude y SIM Swapping) y el **Esfuerzo de Implementación** (complejidad técnica y coordinación con terceros):

```
     Alto |   [WP2: Core & RENIEC/PNP]    |    [WP3: Integración Operadoras]
          |   - Alto valor                |    - Crítico para flujo asíncrono
  V       |   - Esfuerzo medio            |    - Complejidad alta (Coordinación)
  A       |   (Quick Win / Core)          |    (Proyecto Mayor)
  L       |-------------------------------+----------------------------------
  O       |   [WP1: Infraestructura]      |    [WP4: Reconciliación ETL]
  R       |   - Base tecnológica          |    - Auditoría y tableros GFS
          |   - Esfuerzo bajo-medio       |    - Esfuerzo medio-alto
     Bajo |   (Pre-requisito)             |    (Fase de Maduración)
          +-------------------------------+----------------------------------
                        Bajo                             Alto
                                    ESFUERZO
```

### Justificación de la Priorización

1.  **WP1 (Cimentación de Redes) - Prioridad 1 (Fundamento):** Debe ejecutarse primero porque ningún componente transaccional puede operar ni probarse sin la red privada (mTLS y VPNs) con las operadoras y el Estado.
2.  **WP2 (Core Transaccional) - Prioridad 2 (Core & Quick Win):** Su valor es crítico. Al estar centralizado dentro del control de OSIPTEL y RENIEC, su desarrollo no depende del core de red de los operadores. Su liberación temprana permite activar el motor de reglas en "Modo Sombra" (Shadow Mode) para recopilar estadísticas de biometría rápidamente.
3.  **WP3 (Integración Operadoras) - Prioridad 3 (Impacto en SLA):** Es el de mayor esfuerzo porque requiere coordinar ventanas de mantenimiento con las 4 operadoras y modificar sus sistemas core de red (HLR). Sin embargo, es el que materializa la reducción del tiempo de bloqueo de 24h a <1h.
4.  **WP4 (Analítica ETL) - Prioridad 4 (Auditoría):** Es un proceso ex-post. Su implementación puede avanzar en paralelo mientras se estabiliza el tráfico transaccional en producción, sirviendo como el control final de consistencia.

---
*Nota: La secuencia de implementación basada en esta priorización y las dependencias de los paquetes de trabajo se detallan formalmente en la Hoja de Ruta e Incrementos ([02_arquitecturas_transicion.md](file:///D:/aempre/Fase%20E/02_arquitecturas_transicion.md)).*
