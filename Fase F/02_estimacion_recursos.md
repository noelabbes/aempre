# Estimación de Costos y Recursos (Fase F)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable presenta la **Estimación de Presupuestos y Recursos** requeridos para el diseño, implementación y operación del sistema SIPBA. La estructura financiera se divide en gastos de capital inicial (**CapEx**) y costos operativos recurrentes (**OpEx**), detallando la infraestructura en la nube, el licenciamiento y los recursos humanos internos de OSIPTEL.

---

## 1. Estructura de Costos de Implementación (CapEx)

El CapEx representa los costos únicos de adquisición, desarrollo e inicialización del proyecto durante los primeros 12 meses (alineados con las Arquitecturas de Transición AT1, AT2 y AT3):

| Categoría / Paquete | Descripción | Costo Estimado (USD) |
| :--- | :--- | :---: |
| **WP1: Redes e Infraestructura** | Aprovisionamiento inicial, enrutamiento físico y distribución de certificados. | \$ 25,000 |
| **WP2: Core y RENIEC/PNP** | Desarrollo de software a medida del `SIPBA-GW` y `SIPBA-CORE`. Integraciones de APIs estatales. | \$ 180,000 |
| **WP3: Integración Operadoras** | Consultoría externa y consultores dedicados para homologación de las 4 operadoras. | \$ 90,000 |
| **WP4: ETL y Analítica** | Implementación del motor Spark y tableros GFS. | \$ 65,000 |
| **Hardware de Seguridad (HSM)** | Adquisición física de 2 dispositivos HSM FIPS 140-3 Nivel 3 en rack para OSIPTEL. | \$ 80,000 |
| **Gestión y Calidad (QA/DevOps)** | Pruebas de estrés transaccional, automatización CI/CD y aseguramiento de calidad. | \$ 45,000 |
| **TOTAL CAPEX ESTIMADO** | **Costo de desarrollo, licenciamiento y hardware inicial.** | **\$ 485,000** |

---

## 2. Costos Operativos Mensuales (OpEx)

El OpEx proyecta el costo recurrente necesario para mantener la plataforma operativa las 24 horas del día con alta disponibilidad y planes de resiliencia:

### 2.1. Costos de Nube y Middleware (AWS / Azure)
*   **Cómputo Transaccional (EKS):** 3 Zonas de disponibilidad con autoescalado (familias c6i). $\rightarrow$ \$ 2,200 / mes.
*   **Bases de Datos (PostgreSQL Aurora Multi-AZ):** Replicación síncrona y almacenamiento dinámico. $\rightarrow$ \$ 4,800 / mes.
*   **Bus de Mensajería (AWS MSK - Kafka):** 3 Brokers gestionados y retención de discos. $\rightarrow$ \$ 3,500 / mes.
*   **Caché Distribuido (Redis Cluster):** Sharding en memoria de alta velocidad. $\rightarrow$ \$ 1,200 / mes.
*   **Respaldo DR Multi-Región (Warm Standby):** Replicación inactiva en segunda región. $\rightarrow$ \$ 2,800 / mes.

### 2.2. Costos de Conectividad y Redes Dedicadas
*   **AWS Direct Connect / Enlaces VPN:** Canales de fibra privados redundantes con operadoras. $\rightarrow$ \$ 4,500 / mes.
*   **Soporte Premium RENIEC (PIDE):** Tasa por volumen de consultas biométricas. $\rightarrow$ \$ 8,000 / mes.

### 2.3. Resumen Operativo Mensual (OpEx)

| Concepto OpEx | Costo Mensual (USD) | Costo Anualizado (USD) |
| :--- | :---: | :---: |
| Infraestructura Cloud y Middleware | \$ 14,500 | \$ 174,000 |
| Canales de Red y Comunicaciones B2B | \$ 4,500 | \$ 54,000 |
| Consultas de Cotejo RENIEC | \$ 8,000 | \$ 96,000 |
| Soporte de Proveedores y Mantenimiento | \$ 5,000 | \$ 60,000 |
| **TOTAL OPEX ESTIMADO** | **\$ 32,000 / mes** | **\$ 384,000 / año** |

---

## 3. Mapeo de Recursos Humanos Internos (OSIPTEL)

Para operar la plataforma y asegurar su correcta adopción, se requiere asignar o contratar los siguientes perfiles dentro del organigrama del regulador:

### A. Gerencia de Tecnologías de la Información (GTIC)
*   **1 Arquitecto de Cloud & DevOps (Dedicado):** Responsable de la infraestructura de red, seguridad en Kubernetes, despliegues y gestión de secretos.
*   **1 Administrador de Base de Datos y Datos (DBA/Data Engineer) (Dedicado):** Operación de PostgreSQL Aurora, Redis y automatización de los pipelines Spark de reconciliación nocturna.
*   **1 Administrador de Ciberseguridad (HSM / IAM) (Parcial):** Encargado de la rotación de certificados mTLS, llaves encriptadas en el HSM y políticas de seguridad WAF.

### B. Gerencia de Supervisión y Fiscalización (GFS)
*   **2 Analistas de Riesgo y Fiscalización Operativa (Dedicados):** Encargados de monitorear el tablero analítico de distribuidores, validar alertas de *Strike 3* y coordinar clausuras de puntos de venta con las operadoras.

### C. Gerencia de Usuarios (GU)
*   **2 Personal de Soporte Interinstitucional (Dedicados):** Atender incidentes relacionados con bloqueos accidentales, reclamos ciudadanos de SIM Swapping y coordinación de tickets de contingencia con la PNP.

---
*Nota: La estructura de costos y asignación de recursos descrita en este documento está sujeta al cumplimiento de las auditorías de conformidad y los acuerdos de nivel de servicio (SLA) detallados en el Marco de Gobernanza del Proyecto ([03_gobernanza_proyecto.md](file:///D:/aempre/Fase%20F/03_gobernanza_proyecto.md)).*
