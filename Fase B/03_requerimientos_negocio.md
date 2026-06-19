# Catálogo de Requerimientos de Negocio (Fase B: Arquitectura de Negocio)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este documento cataloga y prioriza los requerimientos de negocio funcionales y no funcionales para el sistema SIPBA. Cada requerimiento está diseñado para mitigar los desafíos institucionales de OSIPTEL (seguridad, transparencia del dato, alta carga de reclamos y autonomía) y se alinea con los principios establecidos en la Fase Preliminar.

---

## 1. Categorías de Requerimientos

Para facilitar la trazabilidad técnica, los requerimientos se clasifican en:
*   **Funcionales de Negocio (REQ-FUN):** Reglas, flujos, validaciones y reportes operativos directamente visibles por las gerencias y los usuarios.
*   **No Funcionales / Calidad de Negocio (REQ-NFR):** Atributos de calidad tales como latencia, disponibilidad, ciberseguridad, y cumplimiento normativo (LPDP).

---

## 2. Catálogo Priorizado de Requerimientos

| ID | Requerimiento de Negocio | Categoría | Prioridad | Stakeholder Origen | Alineación con Principios de AE | Descripción y Criterio de Aceptación |
| :--- | :--- | :---: | :---: | :--- | :--- | :--- |
| **REQ-FUN-01** | Validación Biométrica Obligatoria | REQ-FUN | **Alta** | GFS / AFIN (Operadoras) | [P1: Seguridad sobre Agilidad](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md#L7-L14) | El 100% de las activaciones de nuevas líneas y reposiciones de chip deben validar biométricamente la identidad del titular con RENIEC. No se permiten activaciones en diferido. |
| **REQ-FUN-02** | Regla de Límite Preventivo (7 Líneas) | REQ-FUN | **Alta** | GPRC / PNP | [P1: Seguridad sobre Agilidad](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md#L7-L14) | Bloqueo perimetral automático si un titular intenta activar una línea y registra 7 o más líneas móviles activas a nivel nacional (todas las operadoras sumadas). |
| **REQ-FUN-03** | Bloqueo Inmediato por Denuncia PNP | REQ-FUN | **Alta** | PNP (DIVINDAT) / GFS | [P4: Cooperación Interinstitucional](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md#L29-L35) | Al recibir un evento de denuncia firmado digitalmente por la PNP, el sistema debe emitir la orden e inhabilitar la línea en la red móvil (HLR/HSS) en **menos de 1 hora** (SLA). |
| **REQ-FUN-04** | Penalización Automática "3 Strikes" | REQ-FUN | **Alta** | GFS | [P8: Fiscalización Basada en Riesgos](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md#L57-L63) | Revocación automática del Token de Acceso OAuth a las APIs del distribuidor al registrarse el 3er incidente de suplantación de identidad en un plazo móvil de 12 meses. |
| **REQ-FUN-05** | Reconciliación y Linaje de Conexiones | REQ-FUN | **Media** | GPRC / Inversionistas | [P7: Transparencia y Veracidad del Dato](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md#L50-L56) | Reconciliación diaria automatizada de las bases de datos de conexiones reportadas por operadores contra RENTESEG. Cada reporte debe contener metadatos de linaje inalterables. |
| **REQ-FUN-06** | Canal de Autoservicio Ciudadano | REQ-FUN | **Media** | Gerencia de Usuarios (GU) | [P9: Enfoque Centrado en Reclamos](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md#L64-L70) | Habilitar una API y un portal web para que los ciudadanos consulten de forma directa el estado transaccional de sus líneas y gestionen quejas de manera ágil. |
| **REQ-NFR-01** | Privacidad por Diseño (Cumplimiento LPDP) | REQ-NFR | **Alta** | GTIC / Oficial de Privacidad | [P2: Privacidad y Custodia Federada](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md#L15-L21) | Queda estrictamente prohibido que OSIPTEL almacene o custodie fotografías o vectores biométricos crudos de ciudadanos. Solo se almacenarán hashes criptográficos de auditoría. |
| **REQ-NFR-02** | Latencia Máxima Perimetral (< 3s) | REQ-NFR | **Alta** | AFIN / GTIC | [P5: Eficiencia y Alto Rendimiento](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md#L36-L42) | El tiempo de respuesta total del API Gateway (incluyendo validación de reglas y cotejo con RENIEC) no debe exceder los **3 segundos** en condiciones normales de operación. |
| **REQ-NFR-03** | Desacoplamiento y Autonomía Reglas | REQ-NFR | **Alta** | Comité de AE / GPRC | [P6: Autonomía y Continuidad Operativa](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md#L43-L49) | Las reglas de negocio de validación y penalización deben residir y ejecutarse en la infraestructura de OSIPTEL, de manera independiente del software comercial del operador móvil. |
| **REQ-NFR-04** | Alta Disponibilidad Crítica (99.99%) | REQ-NFR | **Alta** | GTIC | [P4: Cooperación Interinstitucional](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md#L29-L35) | El API Gateway y el motor transaccional deben operar con una disponibilidad anual del 99.99% para evitar la interrupción del canal de emergencias policiales. |

---

## 3. Matriz de Trazabilidad: Objetivos SMART vs. Requerimientos

Esta sección asocia los requerimientos técnicos con los objetivos de negocio definidos en el [Business Motivation Model (BMM)](file:///D:/aempre/Fase%20A/02_bmm.md):

*   **Meta 1: Erradicar la extorsión inmediata y SIM Swapping**
    *   *Objetivo SMART:* Reducir el tiempo de bloqueo de la línea a menos de 1 hora.
    *   *Requerimientos asociados:* **REQ-FUN-03** (Bloqueo en tiempo real) y **REQ-NFR-04** (Disponibilidad 99.99%).
*   **Meta 2: Eliminar la suplantación de identidad en ventas**
    *   *Objetivo SMART:* Asegurar que el 100% de las activaciones críticas pasen por control biométrico en 12 meses.
    *   *Requerimientos asociados:* **REQ-FUN-01** (Biometría facial), **REQ-FUN-02** (Límite de 7 líneas), y **REQ-NFR-02** (Latencia < 3s).
*   **Meta 3: Desarticular mafias y distribuidores corruptos**
    *   *Objetivo SMART:* Inhabilitar el acceso a los distribuidores fraudulentos de forma preventiva.
    *   *Requerimientos asociados:* **REQ-FUN-04** (Regla de 3 Strikes) y **REQ-NFR-03** (Autonomía de reglas de negocio).
*   **Meta 4: Consolidar la confianza e inversionistas**
    *   *Objetivo SMART:* Reducir a 0% las inconsistencias inexplicadas de reportes de conexiones fijas/móviles.
    *   *Requerimientos asociados:* **REQ-FUN-05** (Reconciliación y Linaje de datos) y **REQ-FUN-06** (Autoservicio Ciudadano).
