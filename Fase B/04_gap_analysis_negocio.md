# Análisis de Brechas de Negocio (Gap Analysis - Fase B)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este documento presenta el análisis formal de brechas (Gap Analysis) de la Arquitectura de Negocio de OSIPTEL. Identifica las diferencias críticas entre la situación actual (AS-IS) y la situación objetivo (TO-BE), clasificando las brechas para guiar la transición operativa y el diseño de la solución técnica.

---

## 1. Clasificación de Brechas de Negocio

De acuerdo con la metodología TOGAF, las brechas se clasifican en tres categorías operativas:
1.  **Capacidades Modificadas (M):** Procesos existentes que se optimizan, automatizan o cambian de dueño para mejorar el rendimiento.
2.  **Capacidades Adicionadas (A):** Nuevos controles, flujos o reglas de negocio que no existen actualmente y deben construirse.
3.  **Capacidades Eliminadas (E):** Prácticas obsoletas o vulnerables que se erradican para garantizar la seguridad del ecosistema.

---

## 2. Matriz de Gap Analysis de Negocio

| Área / Capacidad de Negocio | Estado Actual (AS-IS) | Estado Objetivo (TO-BE) | Tipo | Impacto de la Brecha / Acción para el Cierre |
| :--- | :--- | :--- | :---: | :--- |
| **Gobernanza de Reglas Comerciales** | Las operadoras móviles definen y aplican localmente sus propios controles de activación comercial. | OSIPTEL orquesta y aplica perimetralmente las reglas de control (límites de líneas, listas negras) en su API Gateway. | **M** | **Alto:** Traslada el control técnico al regulador. Requiere el desarrollo del motor de reglas central de SIPBA. |
| **Validación de Identidad en Ventas** | Validación biométrica facial opcional, delegada y vulnerable (sin detección obligatoria de prueba de vida). | Validación biométrica facial con *Liveness Detection* obligatoria y cotejo directo 1:1 contra RENIEC. | **A** | **Crítico:** Erradica el anonimato. Exige a las operadoras actualizar sus aplicaciones móviles y terminales de venta. |
| **Instrucción y Ejecución de Bloqueo** | Flujo manual/batch offline con una latencia de 24 a 48 horas. Procesamiento nocturno de listas negras. | Procesamiento asíncrono en tiempo real (SLA < 1 hora) basado en eventos de denuncia PNP propagados vía Kafka. | **M** | **Crítico:** Reduce drásticamente la ventana de extorsión. Requiere integrar el core de red (HLR) de operadoras con SIPBA. |
| **Control de Canal de Distribución** | Fiscalización reactiva posterior (auditorías físicas aleatorias y multas administrativas lentas). | Penalización y revocación inmediata de accesos del punto de venta en el Gateway mediante la regla de "3 Strikes". | **A** | **Alto:** Desarticula mafias en distribuidores. Requiere el módulo analítico de riesgo de la GFS y control de tokens OAuth. |
| **Auditoría de Datos y Portabilidad** | Carga y consolidación periódica manual. Reportes sectoriales con discrepancias estadísticas. | Reconciliación diaria automatizada de líneas reportadas con metadatos de linaje de datos auditable. | **A** | **Medio:** Garantiza la veracidad del mercado. Requiere pipelines de datos ETL robustos en la GTIC. |
| **Activaciones Ambulatorias de Chips** | Venta libre de chips en la vía pública sin controles efectivos de identidad, propensa a la suplantación. | Prohibición absoluta de venta informal y denegación automática en Gateway de activaciones sin coordenadas GPS válidas. | **E** | **Alto:** Elimina el canal de mayor fraude. Requiere fiscalización inteligente de la GFS orientada a geolocalización. |

---

## 3. Impacto Organizacional y Plan de Mitigación

Para cerrar estas brechas de negocio, las unidades de OSIPTEL detalladas en el [Catálogo de Organización](file:///D:/aempre/Fase%20B/02_catalogo_organizacion.md) experimentarán los siguientes impactos:

### A. Gerencia de Supervisión y Fiscalización (GFS)
*   **Impacto:** Transición de un modelo de inspección en campo aleatorio a uno enfocado en el **Ranking de Riesgo de Distribuidores**.
*   **Acción de Cierre:** Capacitar a los fiscalizadores en el uso del tablero analítico de riesgo y definir protocolos de intervención física urgente cuando el sistema gatille una alerta de *Strike 3* (clausura comercial del punto de venta).

### B. Gerencia de Tecnologías de la Información (GTIC)
*   **Impacto:** Necesidad de administrar una plataforma transaccional en tiempo real crítica con alta concurrencia, expuesta a internet y conectada con la PNP y RENIEC.
*   **Acción de Cierre:** Contratar o formar perfiles de Arquitectura de APIs y especialistas en Ciberseguridad (IAM) para operar el API Gateway, y diseñar planes de contingencia ante caídas de la base nacional de RENIEC (*Shadow Mode*).

### C. Gerencia de Usuarios (GU)
*   **Impacto:** Integración de la recepción de reclamos y denuncias virtuales de suplantación de identidad para inhabilitar de forma inmediata el chip clonado.
*   **Acción de Cierre:** Integrar el canal de denuncias de la PNP (DIVINDAT) con la mesa de ayuda de OSIPTEL para asegurar la trazabilidad del estado de las líneas inhabilitadas por orden policial.

---

## 4. Conclusión del Gap Analysis

El análisis de brechas confirma que la transformación de OSIPTEL hacia el modelo SIPBA no es meramente un cambio tecnológico (software), sino una **redefinición de sus capacidades de negocio**. Al eliminar la venta informal de chips, centralizar la aplicación de reglas y automatizar los bloqueos interinstitucionales en menos de una hora, OSIPTEL asume el rol de garante del ecosistema. Las brechas aquí mapeadas servirán como entradas directas para diseñar la Arquitectura de Sistemas de Información (Fase C) y la Arquitectura de Tecnología (Fase D).
