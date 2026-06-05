# Estado del Proyecto SIPBA: Hoja de Ruta y Brechas de Desarrollo

Este documento resume la estructura de la presentación ejecutiva requerida y el diagnóstico de los artefactos pendientes en el repositorio para cumplir con la entrega final de las fases Preliminar, Visión (A) y Negocio (B).

---

## 1. Estructura de Slides (Presentación Ejecutiva)
Esta secuencia de diapositivas está diseñada para una exposición de nivel directivo, siguiendo la metodología ADM (**Entradas $\rightarrow$ Pasos $\rightarrow$ Salidas**).

| Slide | Título | Contenido Clave |
| :--- | :--- | :--- |
| **01** | **Portada** | Proyecto SIPBA, Integrantes y Logotipo Osiptel. |
| **02** | **Resumen Ejecutivo** | Problema (SIM Swapping) y Solución (Hub Transaccional). |
| **03** | **Fase Preliminar: Contexto** | Entradas: Planeamiento Estratégico y Marco Legal (DL 1738). |
| **04** | **Fase Preliminar: Pasos** | Definición de Capacidad de AE, Metamodelo y Repositorio GitHub. |
| **05** | **Fase Preliminar: Salidas** | Principios de Arquitectura (Seguridad, Interoperabilidad, etc.). |
| **06** | **Fase A (Visión): BMM** | Motivación de Negocio: Influenciadores, Metas y Objetivos SMART. |
| **07** | **Fase A (Visión): AS-IS** | Árbol de Problemas y puntos de falla (Latencia de 24h). |
| **08** | **Fase A (Visión): TO-BE** | Visión del sistema SIPBA y rol de Garante de Osiptel. |
| **09** | **Fase A (Visión): Stakeholders** | Mapa de involucrados (RENIEC, PNP, Operadoras) y compromiso. |
| **10** | **Fase B (Negocio): Entradas** | Requerimientos de negocio y catálogos de actores/roles. |
| **11** | **Fase B (Negocio): Pasos** | Modelado de procesos TO-BE (Biometría $\rightarrow$ Bloqueo). |
| **12** | **Fase B (Negocio): Salidas** | Arquitectura de Procesos y funciones clave del servicio. |
| **13** | **Fase B (Negocio): Gaps** | Análisis de brechas de negocio: Manual/Batch vs Automático. |
| **14** | **Roadmap SIPBA** | Cronograma de implementación y fases del despliegue. |
| **15** | **Conclusiones** | Valor de negocio: Reducción del 80% del fraude por suplantación. |

---

## 2. Artefactos Pendientes de Desarrollo
Para alcanzar el 100% de cumplimiento con la asignación del profesor, se deben desarrollar los siguientes elementos en el repositorio:

### Fase Preliminar (Completada)
*   [x] **Principios de Arquitectura:** Documento formal con los 5 principios rectores (`03_principios.md`): Seguridad, Privacidad, Interoperabilidad, Cooperación y Rendimiento.
*   [x] **Capacidad y Metamodelo:** Definición de roles y estándares de gobernanza (`01_capacidad.md`, `02_metamodelo.md`).
*   [x] **Repositorio GitHub:** Estructura de carpetas y control de versiones operativo.

### Fase A: Visión de Arquitectura (Casi completada)
*   [x] **Mapa de Stakeholders (Matriz Poder/Interés):** Documentada con niveles de compromiso y vistas requeridas por actor (RENIEC, PNP, Operadoras).
*   **Statement of Architecture Work (SoAW):** Pendiente (Contrato de arquitectura y alcance formal).

### Fase B: Arquitectura de Negocio (Fase Crítica - Pendiente)
*   **Catálogo de Organización:** Descripción de las unidades de Osiptel que operarán el SIPBA (Matriz RACI extendida).
*   **Modelado de Procesos (BPMN/Texto):**
    *   Proceso de Activación con Biometría (TO-BE).
    *   Proceso de Denuncia e Instrucción de Bloqueo (Interacción PNP-SIPBA).
    *   Proceso de Sanción Automática a Distribuidores.
*   **Catálogo de Requerimientos de Negocio:** Lista priorizada de funciones solicitadas por los usuarios finales (Osiptel/PNP).
*   **Gap Analysis de Negocio:** Cuadro comparativo formal de las capacidades de negocio actuales vs. las futuras.

---
*Nota: Se recomienda crear la carpeta `05_Arquitectura_Negocio` para iniciar con estos desarrollos.*
