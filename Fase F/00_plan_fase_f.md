# Plan de Trabajo (Fase F: Planificación de la Migración)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este documento define la hoja de ruta y la estructura de entregables para abordar la **Fase F** (Planificación de la Migración) del ciclo ADM de TOGAF. La Fase F formaliza el plan de implementación, prioriza los proyectos, administra los riesgos tecnológicos y de transición, estima los recursos necesarios y establece el marco de gobernanza para la ejecución del SIPBA.

---

## 1. Entregables Propuestos para la Fase F

Para estructurar la planificación detallada de la migración, la Fase F se dividirá en tres entregables principales dentro de la carpeta raíz `/Fase F/`:

### 🎁 Entregable F.1: Análisis de Riesgos y Mitigación de la Migración (`01_riesgos_migracion.md`)
*   **Identificación de Riesgos de Transición:** Evaluar amenazas como la resistencia técnica de las operadoras, cuello de botella en los tiempos de respuesta del API de RENIEC, pérdida de consistencia de datos históricos y fallos en las reglas de geolocalización.
*   **Matriz de Impacto y Probabilidad:** Clasificación formal de los riesgos.
*   **Planes de Contingencia y Mitigación:** Acciones operativas para cada escenario de riesgo.

### 🎁 Entregable F.2: Estimación de Costos y Recursos (`02_estimacion_recursos.md`)
*   **Costos de Infraestructura y Licenciamiento:** Estimación de servicios de nube (EKS, Aurora, Kafka MSK, Redis), adquisición del HSM físico y enlaces Direct Connect.
*   **Esfuerzo de Desarrollo y Consultoría:** Horas/hombre estimadas para el desarrollo del core y adaptaciones de terceros (operadoras).
*   **Mapeo de Recursos Humanos Internos:** Requerimientos de perfiles técnicos y operativos dentro de OSIPTEL (GTIC, GFS, GU).

### 🎁 Entregable F.3: Marco de Gobernanza del Proyecto (`03_gobernanza_proyecto.md`)
*   **Estructura del Comité de Gobernanza:** Roles y responsabilidades del Comité de Arquitectura y Seguimiento de SIPBA.
*   **Proceso de Revisión de Conformidad (Architecture Compliance):** Pautas para auditar que el desarrollo del software de las operadoras cumpla al 100% con los contratos de APIs definidos en la Fase C.
*   **SLA de Soporte e Incidentes:** Acuerdos de nivel de servicio para soporte interinstitucional (OSIPTEL-PNP-RENIEC-Operadoras) en producción.

---

## 2. Cronograma de Sesiones de Diseño (Fase F)

Seguiremos la siguiente secuencia de desarrollo:

*   **Paso 1: Hoja de Ruta de Gobernanza** $\rightarrow$ Creación del Plan de Trabajo (`00_plan_fase_f.md`).
*   **Paso 2: Evaluación y Mitigación de Riesgos** $\rightarrow$ Elaboración de `01_riesgos_migracion.md` para proteger la continuidad de la red móvil nacional.
*   **Paso 3: Presupuesto y Recursos** $\rightarrow$ Elaboración de `02_estimacion_recursos.md` detallando costos de nube, HSM y capital humano.
*   **Paso 4: Hardening de Gobernanza** $\rightarrow$ Elaboración de `03_gobernanza_proyecto.md` definiendo el comité de seguimiento, auditorías y SLAs productivos.
*   **Paso 5: Cierre General del Ciclo ADM** $\rightarrow$ Consolidación de planos y alineación final del repositorio.
