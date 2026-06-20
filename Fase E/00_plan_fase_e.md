# Plan de Trabajo (Fase E: Oportunidades y Soluciones)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este documento define la hoja de ruta y la estructura de entregables para abordar la **Fase E** (Oportunidades y Soluciones) del ciclo ADM de TOGAF. La Fase E tiene como objetivo identificar proyectos de implementación, estructurar las brechas en paquetes de trabajo prácticos y definir arquitecturas de transición incrementales para pasar del escenario actual (AS-IS) al futuro tecnológico (TO-BE).

---

## 1. Entregables Propuestos para la Fase E

Para guiar la migración del sistema de forma segura e incremental, estructuraremos la Fase E en tres entregables clave en la carpeta raíz `/Fase E/`:

### 🎁 Entregable E.1: Identificación y Clasificación de Paquetes de Trabajo (`01_paquetes_trabajo.md`)
*   **Mapeo de Brechas a Proyectos (Work Packages):** Agrupar las brechas de negocio, datos, aplicaciones y tecnología en 4 proyectos concretos (Infraestructura, Core e Integración Pública, Integración de Operadoras, y Analítica/Reconciliación).
*   **Fichas de Proyectos:** Definir el alcance, objetivos, entregables de software, tecnologías y actores responsables para cada Paquete de Trabajo.
*   **Análisis de Viabilidad y Beneficios:** Matriz de valor contra esfuerzo para priorizar las iniciativas.

### 🎁 Entregable E.2: Hoja de Ruta e Incrementos de Transición (`02_arquitecturas_transicion.md`)
*   **Definición de Arquitecturas de Transición:**
    *   *Arquitectura de Transición 1 (AT1) - Bloqueo Inmediato (Meses 1-4):* Conectividad básica mTLS/VPN, integración con PNP e inhabilitación asíncrona de redes móviles por robo/extorsión.
    *   *Arquitectura de Transición 2 (AT2) - Activación Segura y Reglas Core (Meses 5-8):* Integración biométrica con RENIEC y validación transaccional en puntos de venta.
    *   *Arquitectura de Transición 3 (AT3) - Fiscalización Analítica y Hardening (Meses 9-12):* Reconciliación ETL automatizada, encriptación HSM física y esquema de resiliencia multi-región.
*   **Cronograma Lógico de Implementación:** Diagrama temporal en Mermaid con hitos críticos y dependencias entre paquetes de trabajo.

### 🎁 Entregable E.3: Plan de Coexistencia e Interoperabilidad (`03_plan_coexistencia.md`)
*   **Estrategia de Migración de Datos:** Metodología para cargar los metadatos de las líneas actualmente activas del mercado hacia la base de datos transaccional de SIPBA sin generar interrupciones en el servicio de telefonía.
*   **Mecanismos de Coexistencia (Sistemas Híbridos):** Especificar cómo interactúan los flujos batch heredados (antiguas listas negras) con las APIs basadas en eventos del SIPBA durante el periodo de coexistencia.

---

## 2. Cronograma de Sesiones de Diseño (Fase E)

Seguiremos la siguiente secuencia de desarrollo:

*   **Paso 1: Hoja de Ruta de Negocio** $\rightarrow$ Creación del Plan de Trabajo (`00_plan_fase_e.md`).
*   **Paso 2: Definición de Paquetes de Trabajo** $\rightarrow$ Elaboración de `01_paquetes_trabajo.md` clasificando los proyectos de software e infraestructura.
*   **Paso 3: Diseño de Incrementos y Gantt** $\rightarrow$ Elaboración de `02_arquitecturas_transicion.md` estructurando los plazos de la migración y el diagrama temporal.
*   **Paso 4: Planificación de la Coexistencia** $\rightarrow$ Elaboración de `03_plan_coexistencia.md` detallando las estrategias de migración de datos en vivo y mitigación operativa.
