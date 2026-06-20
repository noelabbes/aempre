# Plan de Trabajo (Fase H: Gestión de Cambios de la Arquitectura)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este documento define la hoja de ruta y la estructura de entregables para abordar la **Fase H** (Gestión de Cambios de la Arquitectura) del ciclo ADM de TOGAF. La Fase H establece los mecanismos, clasificaciones y gobernanza para asegurar que la arquitectura de SIPBA evolucione de manera controlada y segura frente a cambios legales, nuevas tecnologías y amenazas emergentes en ciberseguridad.

---

## 1. Entregables Propuestos para la Fase H

Para estructurar la gestión de cambios y asegurar el ciclo de vida de la arquitectura, la Fase H se dividirá en tres entregables principales dentro de la carpeta raíz `/Fase H/`:

### 🎁 Entregable H.1: Proceso de Gestión de Cambios y Gobernanza Operativa (`01_proceso_gestion_cambios.md`)
*   **Procedimiento de Solicitud de Cambio (RFC):** Proceso formal para solicitar, evaluar y aprobar modificaciones en la arquitectura transaccional de SIPBA.
*   **Clasificación de Cambios de Arquitectura:** Categorización en simplificación (cambios menores), recreación (cambios medianos) y redefinición (cambios mayores).
*   **Flujo de Aprobación de Cambios:** Roles del comité de arquitectura en la evaluación del impacto transaccional y legal.

### 🎁 Entregable H.2: Plan de Mitigación ante Evolución Tecnológica y Amenazas (`02_evolucion_tecnologica.md`)
*   **Estrategia ante Amenazas de IA y Deepfakes:** Procedimiento para actualizar el liveness biométrico en caso de suplantaciones generativas avanzadas.
*   **Transición a Identidad Digital Soberana (SSI):** Plan de evolución para desacoplar el modelo centralizado de RENIEC hacia credenciales verificables descentralizadas.
*   **Evolución de Red (5G/6G):** Directrices tecnológicas para adaptar el bus de eventos y latencias ante la maduración de las redes de comunicaciones móviles.

### 🎁 Entregable H.3: Monitoreo de Capacidad y Madurez de la Arquitectura (`03_monitoreo_capacidad.md`)
*   **Métricas de Valor de Arquitectura:** Indicadores para evaluar si SIPBA sigue cumpliendo los objetivos de negocio de OSIPTEL a largo plazo.
*   **Auditorías Periódicas de Madurez:** Evaluación del modelo de madurez de arquitectura empresarial anual.
*   **Disparadores de Reinicio del Ciclo ADM:** Condiciones bajo las cuales OSIPTEL debe iniciar una nueva Fase Preliminar y Fase A para redefinir el sistema.

---

## 2. Cronograma de Sesiones de Diseño (Fase H)

Seguiremos la siguiente secuencia de desarrollo:

*   **Paso 1: Hoja de Ruta de Mantenimiento de Arquitectura** $\rightarrow$ Creación del Plan de Trabajo (`00_plan_fase_h.md`).
*   **Paso 2: Modelado del Proceso RFC y Gobernanza** $\rightarrow$ Redacción del proceso de gobernanza de cambios (`01_proceso_gestion_cambios.md`).
*   **Paso 3: Análisis de Amenazas y Evolución Tecnológica** $\rightarrow$ Elaboración de `02_evolucion_tecnologica.md` para blindar el ciclo de vida del sistema.
*   **Paso 4: Métricas de Valor y Cierre del ADM** $\rightarrow$ Creación del marco de monitoreo a largo plazo (`03_monitoreo_capacidad.md`).
*   **Paso 5: Cierre General del Repositorio** $\rightarrow$ Integración final de planos.
