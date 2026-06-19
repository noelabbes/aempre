# Plan de Trabajo (Fase C: Arquitecturas de Sistemas de Información)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este documento define la hoja de ruta y la estructura de entregables para abordar la **Fase C** del ciclo ADM de TOGAF. La Fase C se divide en dos dominios fundamentales: **Arquitectura de Datos** y **Arquitectura de Aplicaciones**, diseñados para concretar los procesos y requerimientos modelados en la Fase B.

---

## 1. Entregables Propuestos para la Fase C

Para cubrir de forma exhaustiva este dominio, estructuraremos la Fase C en tres entregables principales dentro de la carpeta raíz `/Fase C/`:

### 🎁 Entregable C.1: Arquitectura de Datos (`01_arquitectura_datos.md`)
*   **Catálogo de Entidades de Datos:** Definir el modelo conceptual y lógico de las entidades clave (DNI del Ciudadano, IMEI del Dispositivo, MSISDN/Línea, Token del Distribuidor, Evento de Bloqueo, Score Biométrico y Auditoría RENTESEG).
*   **Estándares de Privacidad y Cumplimiento (LPDP):** Especificar cómo se disocian y encriptan los datos sensibles en tránsito y reposo (hashes, minucias, no almacenamiento de imágenes de rostros en OSIPTEL).
*   **Modelo de Linaje de Datos:** Detallar los metadatos de linaje (origen, transformación y consumo) para reconciliar las estadísticas sectoriales reportadas al mercado por las operadoras.

### 🎁 Entregable C.2: Arquitectura de Aplicaciones (`02_arquitectura_aplicaciones.md`)
*   **Catálogo de Portafolio de Aplicaciones:** Identificar y describir los componentes de software lógicos requeridos:
    *   *API Gateway Perimetral:* WAF, mTLS, OAuth 2.0, Rate Limiting y esquemas de firma JWT.
    *   *Motor de Reglas Core (SIPBA):* Validador síncrono de límites de líneas y blacklist.
    *   *Bus de Mensajería (Event Broker):* Servidor de colas asíncronas para propagación de bloqueos (Kafka/RabbitMQ).
    *   *Pipeline ETL de Reconciliación:* Motor Spark/Python para auditoría diaria.
*   **Mapa de Relaciones de Aplicación:** Diagrama de componentes que ilustre cómo se comunican estos sistemas internos entre sí y con el exterior.

### 🎁 Entregable C.3: Interfaces e Integración de Sistemas (`03_integracion_sistemas.md`)
*   **Especificación de APIs (Endpoints y Payloads):** Bosquejo lógico de las interfaces B2B de entrada y salida:
    *   *API de Activación (Consumido por Operadoras).*
    *   *API de Bloqueo Inmediato (Consumido por PNP - DIVINDAT).*
    *   *Webhook de Suspensión (Emitido por SIPBA hacia Operadoras).*
    *   *API de Consulta Ciudadana (Consumido por Portal de Autoservicio).*

---

## 2. Cronograma de Sesiones de Diseño (Fase C)

Para abordar los entregables de manera ordenada, seguiremos la siguiente secuencia de desarrollo en las próximas sesiones:

*   **Paso 1: Modelado de Datos (Arquitectura de Datos)** $\rightarrow$ Elaboración de `01_arquitectura_datos.md` priorizando la privacidad y linaje del DNI/IMEI.
*   **Paso 2: Modelado de Software (Arquitectura de Aplicaciones)** $\rightarrow$ Elaboración de `02_arquitectura_aplicaciones.md` detallando el rol del API Gateway y desacoplamiento.
*   **Paso 3: Contratos de Integración (APIs)** $\rightarrow$ Especificación de payloads JSON en `03_integracion_sistemas.md`.
*   **Paso 4: Conformidad y Cierre** $\rightarrow$ Integración de planos lógicos y actualización del índice general del repositorio.
