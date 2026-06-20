# Plan de Trabajo (Fase G: Gobernanza de la Implementación)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este documento define la hoja de ruta y la estructura de entregables para abordar la **Fase G** (Gobernanza de la Implementación) del ciclo ADM de TOGAF. La Fase G tiene como objetivo asegurar la conformidad del sistema desarrollado frente a la arquitectura objetivo mediante contratos de arquitectura, auditorías de desarrollo y recomendaciones de implementación.

---

## 1. Entregables Propuestos para la Fase G

Para estructurar la gobernanza de la fase de construcción de SIPBA, la Fase G se dividirá en tres entregables principales dentro de la carpeta raíz `/Fase G/`:

### 🎁 Entregable G.1: Contrato de Arquitectura del Proyecto (`01_contrato_arquitectura.md`)
*   **Definición de Términos del Contrato:** Acuerdo formal entre la autoridad de arquitectura de OSIPTEL y los proveedores/operadoras encargados del desarrollo.
*   **Métricas de Conformidad de Sistemas:** Requisitos técnicos ineludibles en seguridad, disponibilidad y rendimiento.
*   **Mecanismos de Penalización y Arbitraje:** Consecuencias administrativas y contractuales por el desvío de los lineamientos diseñados.

### 🎁 Entregable G.2: Guía de Revisiones de Conformidad (`02_revisiones_conformidad.md`)
*   **Lista de Chequeo de Conformidad (Compliance Checklist):** Pautas detalladas para auditar el código fuente, la infraestructura de nube, la seguridad de las APIs y la protección LPDP.
*   **Fases del Proceso de Auditoría:** Definición de revisiones en etapa de diseño detallado, desarrollo y pase a producción.
*   **Formato de Reporte de Conformidad:** Plantilla oficial para calificar la conformidad del software desarrollado.

### 🎁 Entregable G.3: Recomendaciones para la Implementación y Despliegue (`03_recomendaciones_despliegue.md`)
*   **Directrices para el Desarrollo de Microservicios:** Prácticas de diseño para `SIPBA-GW` y `SIPBA-CORE`.
*   **Hardening y Ajustes de Base de Datos y Caché:** Recomendaciones de optimización física para PostgreSQL y Redis Cluster.
*   **Estrategia de Integración Continua (CI/CD):** Prácticas seguras para despliegues automatizados en el clúster de Kubernetes.

---

## 2. Cronograma de Sesiones de Diseño (Fase G)

Seguiremos la siguiente secuencia de desarrollo:

*   **Paso 1: Hoja de Ruta de Gobernanza de Construcción** $\rightarrow$ Creación del Plan de Trabajo (`00_plan_fase_g.md`).
*   **Paso 2: Elaboración del Contrato de Arquitectura** $\rightarrow$ Redacción del acuerdo formal de cumplimiento de diseño (`01_contrato_arquitectura.md`).
*   **Paso 3: Checklist de Revisiones de Código y Despliegue** $\rightarrow$ Elaboración de la guía de auditorías de desarrollo (`02_revisiones_conformidad.md`).
*   **Paso 4: Guías de Despliegue y Hardening** $\rightarrow$ Creación de las guías de implementación física y CI/CD (`03_recommendaciones_despliegue.md`).
*   **Paso 5: Cierre de Gobernanza** $\rightarrow$ Integración de planos de gobernanza en el repositorio.
