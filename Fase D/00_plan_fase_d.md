# Plan de Trabajo (Fase D: Arquitectura Tecnológica)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este documento define la hoja de ruta y la estructura de entregables para abordar la **Fase D** (Arquitectura Tecnológica) del ciclo ADM de TOGAF. La Fase D se enfoca en traducir las necesidades lógicas de datos y aplicaciones de la Fase C en una arquitectura física de hardware, redes, sistemas operativos, middleware y plataformas de computación resilientes y seguras.

---

## 1. Entregables Propuestos para la Fase D

Para abordar el diseño tecnológico con rigurosidad, estructuraremos la Fase D en tres entregables principales ubicados en la carpeta raíz `/Fase D/`:

### 🎁 Entregable D.1: Diseño de Infraestructura y Redes (`01_infraestructura_redes.md`)
*   **Topología de Red Híbrida:** Definir la conectividad segura mediante canales dedicados (VPN IPsec, AWS Direct Connect / Azure ExpressRoute) entre las operadoras de telefonía móvil, la red segura de la PNP (DIVINDAT) y la extranet de RENIEC.
*   **Arquitectura de Cómputo y Orquestación:** Especificación física del clúster de Kubernetes (como Red Hat OpenShift o AWS EKS) para soportar el API Gateway (`SIPBA-GW`) y el Motor de Reglas (`SIPBA-CORE`).
*   **Esquema de Alta Disponibilidad de Cómputo:** Configuración multi-región o multi-zona de disponibilidad para garantizar tolerancia a fallas a nivel de hardware.

### 🎁 Entregable D.2: Plataformas de Datos y Eventos (`02_plataformas_datos.md`)
*   **Dimensionamiento del Event Broker:** Diseño físico del clúster de mensajería (Apache Kafka) para soportar la cola de bloqueos y auditoría de activaciones.
*   **Estrategia de Almacenamiento Físico de Datos:** Definir el motor de bases de datos relacional (PostgreSQL en alta disponibilidad con replicador lógico) y almacenamiento de caché en memoria (Redis Cluster) para rate limiting y control de sesiones rápidas.
*   **Políticas de Respaldo y Retención de Datos:** Ciclo de vida del almacenamiento para cumplir con la Ley de Protección de Datos Personales (LPDP) y auditorías.

### 🎁 Entregable D.3: Seguridad de Plataforma y Resiliencia (`03_seguridad_resiliencia.md`)
*   **Integración con HSM (Hardware Security Module):** Conexión física y lógica de las aplicaciones al módulo HSM de OSIPTEL para resguardar las llaves de firmado digital.
*   **Métricas de Recuperación ante Desastres (HA/DR):** Definición de RTO (Recovery Time Objective < 15 minutos) y RPO (Recovery Point Objective < 1 minuto) con planes de conmutación por error (*Failover*).
*   **Stack de Observabilidad y Monitoreo:** Diseño de la infraestructura de logs, métricas y trazas distribuidas (Prometheus, Grafana, OpenTelemetry) para auditorías operativas en tiempo real.

---

## 2. Cronograma de Sesiones de Diseño (Fase D)

Seguiremos la siguiente secuencia de desarrollo:

*   **Paso 1: Hoja de Ruta e Infraestructura** $\rightarrow$ Creación del Plan de Trabajo (`00_plan_fase_d.md`).
*   **Paso 2: Topología Física y Redes** $\rightarrow$ Elaboración de `01_infraestructura_redes.md` con enfoque en conectividad híbrida segura con operadoras.
*   **Paso 3: Plataformas de Middleware y Datos** $\rightarrow$ Elaboración de `02_plataformas_datos.md` definiendo el almacenamiento y bus de eventos.
*   **Paso 4: Hardening de Seguridad y DRP** $\rightarrow$ Elaboración de `03_seguridad_resiliencia.md` definiendo resiliencia, monitoreo y HSM.
*   **Paso 5: Cierre de la Capa Técnica** $\rightarrow$ Consolidación de planos y alineación con las fases previas.
