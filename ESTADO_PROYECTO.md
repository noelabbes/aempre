# Estado del Proyecto SIPBA: Hoja de Ruta y Brechas de Desarrollo

Este documento resume la estructura de la presentación ejecutiva requerida y el diagnóstico de los artefactos del repositorio para cumplir con la entrega final de las fases Preliminar, Visión (A) y Negocio (B).

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

## 2. Artefactos Desarrollados en el Repositorio

Para cumplir con la entrega de las fases del proyecto, se han desarrollado los siguientes elementos en el repositorio:

### Fase Preliminar (Completada y Robustecida)
*   [x] **Principios de Arquitectura:** Documento formal ([03_principios.md](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md)) ampliado con 9 principios (5 originales de seguridad + 4 institucionales de mitigación: Autonomía, Transparencia de Datos, Fiscalización Basada en Riesgos y Enfoque Centrado en Reclamos).
*   [x] **Capacidad y Metamodelo:** Definición de roles, modelo de madurez, RACI del Comité de AE y metamodelo ampliado con capas estratégicas y de linaje de datos ([01_capacidad.md](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/01_capacidad.md), [02_metamodelo.md](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/02_metamodelo.md)).
*   [x] **Marco de Arquitectura a Medida:** Unificación terminológica a SIPBA, redefinición de alcance a OSIPTEL e integración con SEGDI y PIDE ([Marco de Arquitectura a Medida.md](file:///D:/aempre/Fase%20Preliminar/Marco_de_Arquitectura.md/Marco%20de%20Arquitectura%20a%20Medida.md)).
*   [x] **Repositorio GitHub:** Estructura de carpetas y control de versiones operativo.

### Fase A: Visión de Arquitectura (Completada y Robustecida)
*   [x] **Mapa de Stakeholders (Matriz Poder/Interés):** Documentada con niveles de compromiso y vistas requeridas por actor (RENIEC, PNP, Operadoras) ([03_stakeholders.md](file:///D:/aempre/Fase%20A/03_stakeholders.md)).
*   [x] **Statement of Architecture Work (SoAW):** Contrato formal del proyecto SIPBA diseñado, detallando alcance, cronograma y mitigación de riesgos de gobernanza ([05_soaw.md](file:///D:/aempre/Fase%20A/05_soaw.md)).
*   [x] **Diagrama de Concepto de Solución:** Integrado en la Visión de Arquitectura ([01_vision.md](file:///D:/aempre/Fase%20A/01_vision.md)) detallando la interconexión con RENIEC, PNP y operadoras móviles.
*   [x] **Modelo de Motivación de Negocio (BMM):** Estructura estratégica con metas, objetivos SMART e influenciadores ([02_bmm.md](file:///D:/aempre/Fase%20A/02_bmm.md)).

### Fase B: Arquitectura de Negocio (Completada y Robustecida)
*   [x] **Catálogo de Organización:** Descripción de las unidades de Osiptel que operarán el SIPBA, con mapeo de actores y matriz RACI de procesos ([02_catalogo_organizacion.md](file:///D:/aempre/Fase%20B/02_catalogo_organizacion.md)).
*   [x] **Modelado de Procesos (BPMN/Texto):**
    *   [x] Proceso de Activación con Biometría (TO-BE) ([01_procesos_negocio.md#L9-L43](file:///D:/aempre/Fase%20B/01_procesos_negocio.md#L9-L43)).
    *   [x] Proceso de Denuncia e Instrucción de Bloqueo (Interacción PNP-SIPBA) ([01_procesos_negocio.md#L45-L77](file:///D:/aempre/Fase%20B/01_procesos_negocio.md#L45-L77)).
    *   [x] Proceso de Sanción Automática a Distribuidores ([01_procesos_negocio.md#L79-L113](file:///D:/aempre/Fase%20B/01_procesos_negocio.md#L79-L113)).
*   [x] **Catálogo de Requerimientos de Negocio:** Lista priorizada de funciones y requerimientos de calidad (SLA, seguridad, LPDP) solicitadas por los usuarios y sistemas ([03_requerimientos_negocio.md](file:///D:/aempre/Fase%20B/03_requerimientos_negocio.md)).
*   [x] **Gap Analysis de Negocio:** Cuadro comparativo de las capacidades y brechas de negocio AS-IS vs. TO-BE (capacidades añadidas, eliminadas o modificadas) e impacto de la transición ([04_gap_analysis_negocio.md](file:///D:/aempre/Fase%20B/04_gap_analysis_negocio.md)).

### Fase C: Arquitecturas de Sistemas de Información (Planificada - En Cola)
*   [x] **Modelo de Trabajo y Plan de Entregables:** Roadmap de diseño para Datos, Aplicaciones e Interfaces de Integración ([00_plan_fase_c.md](file:///D:/aempre/Fase%20C/00_plan_fase_c.md)).
*   **Arquitectura de Datos:** Catálogo de entidades, estándares de protección LPDP y linaje de datos sectoriales (Pendiente).
*   **Arquitectura de Aplicaciones:** Catálogo de portafolio, mapa lógico y desacoplamiento de API Gateway (Pendiente).
*   **Interfaces de Integración:** Especificación técnica de contratos de APIs (RENIEC, PNP y Operadoras) (Pendiente).

---
*Nota: Todos los desarrollos se organizan en sus respectivas carpetas raíz (`/Fase Preliminar/`, `/Fase A/`, `/Fase B/` y `/Fase C/`).*
