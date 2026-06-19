# Marco de Arquitectura a Medida (Tailored Architecture Framework)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)
OSIPTEL – Organismo Supervisor de Inversión Privada en Telecomunicaciones

---

### Información del Documento

| Campo | Detalle |
|---|---|
| **Nombre del Proyecto** | Proyecto OSIPTEL – SIPBA |
| **Preparado por** | Grupo 2 – Arquitectura Empresarial |
| **No. Versión del Documento** | 1.1 |
| **Título** | Marco de Arquitectura a Medida |
| **Fecha de Versión** | Junio 2026 |
| **Revisado por** | Comité de AE / GTIC |
| **Fecha de Revisión** | Junio 2026 |

### Lista de Distribución

| De | Fecha | Correo / Jefatura |
|---|---|---|
| Grupo 2 – Arquitectura Empresarial | Junio 2026 | |

| A | Acción* | Fecha límite | Correo / Oficina |
|---|---|---|---|
| Presidencia del Consejo Directivo | Aprobar / Revisar | Por definir | presidencia@osiptel.gob.pe |
| Gerente General | Revisar | H1 | gg@osiptel.gob.pe |
| Gerente de la GTIC | Revisar | H1 | gtic@osiptel.gob.pe |
| Gerente de la GFS | Informar | H1 | gfs@osiptel.gob.pe |
| Gerente de la GU | Informar | H1 | gu@osiptel.gob.pe |

### Historial de Versiones del Documento

| Ver. No. | Ver. Fecha | Revisado por | Descripción | Nombre del archivo |
|---|---|---|---|---|
| 1.0 | Jun 2026 | Grupo 2 | Primera versión de TOGAF 9 adaptada para SIDBET. | TOGAF - Tailored Architecture Framework (OSIPTEL) |
| 1.1 | Jun 2026 | Grupo 2 | Robustecimiento integral de AE: alineación terminológica a SIPBA, redefinición de alcance de OSIPTEL, gobierno de datos, y alineación con SEGDI (PCM) y PIDE. | TOGAF - Tailored Architecture Framework (OSIPTEL) v1.1 |

---

## 1. Propósito del Documento

Este documento formaliza el Marco de Arquitectura Adaptado (Tailored Architecture Framework) para el Organismo Supervisor de Inversión Privada en Telecomunicaciones (OSIPTEL) del Perú, específicamente adaptado para el diseño, gobernanza e implementación del **Sistema de Identidad Personal y Bloqueo Automático (SIPBA)**. La creciente prevalencia de la extorsión telefónica, el SIM Swapping y el fraude por suplantación en el Perú exige que OSIPTEL despliegue una respuesta de arquitectura robusta que trascienda lo puramente informático.

La complejidad de regular el sector y coordinar interinstitucionalmente exige que el marco estándar TOGAF 9.2 sea personalizado en dos niveles estratégicos:

- **Adaptación a Nivel de la Entidad (Institucional):** Sincroniza el Método de Desarrollo de la Arquitectura (ADM) con la estrategia corporativa de OSIPTEL y las directrices de la Secretaría de Gobierno y Transformación Digital (SEGDI) de la PCM, la Ley de Gobierno Digital (DL 1412), la Ley de Protección de Datos Personales (Ley N.° 29733) y la Plataforma de Interoperabilidad del Estado (PIDE).
- **Adaptación a Nivel de Proyecto:** Estructura un conjunto de entregables de arquitectura orientados a robustecer la supervisión basada en riesgos, la transparencia en los reportes públicos de líneas y la automatización inteligente del flujo masivo de quejas ciudadanas.

---

## 2. Método de Arquitectura a Medida

### 2.1 Método de Arquitectura

OSIPTEL adopta el ciclo ADM (Architecture Development Method) de TOGAF 9.2 como base metodológica, integrando la gobernanza de datos y la supervisión inteligente de portafolios como capacidades núcleo.

| FASE DEL ADM TOGAF | DESCRIPCIÓN ADAPTADA OSIPTEL | PROPÓSITO DEL CONTROL DE CAPACIDADES |
|---|---|---|
| **Fase Preliminar** | Establecimiento de la capacidad de AE dentro de OSIPTEL (GTIC, GFS, GU, GPRC). Definición del modelo organizativo, el alcance de la empresa y principios institucionales que blindan la continuidad operativa y la transparencia. | Establece la línea base de gobernanza, las reglas de juego institucionales y la mitigación de inestabilidad política antes de iniciar el ciclo ADM. |
| **Fase A: Visión de la Arquitectura** | Alineación estratégica con el PEI de OSIPTEL, la Política Nacional de Transformación Digital y validación de interesados (Alta Dirección OSIPTEL, PNP, RENIEC, operadoras móviles). | Punto de evaluación formal del Capability Assessment, validando la viabilidad estratégica y los límites de interoperabilidad interinstitucional. |
| **Fase B: Arquitectura de Negocio** | Modelado de los procesos regulatorios, fiscalizadores y de resolución de quejas utilizando notación BPMN. Rediseño del flujo de bloqueos automáticos y auditorías de líneas. | Identifica la preparación operativa de las gerencias usuarias (GFS, GU, GPRC) para operar bajo el modelo SIPBA y absorber la alta carga de reclamos. |
| **Fase C: Arquitecturas de Sistemas de Información** | Estructuración de datos y planos de aplicaciones. En Datos, definición del linaje y consistencia de los datos reportados (para evitar discrepancias). En Aplicaciones, diseño del API Gateway SIPBA y de los servicios core de control. | Evalúa la madurez de los datos (calidad, gobierno de datos perimetrales) y la interoperabilidad de los sistemas, en especial consumiendo servicios de RENIEC y PIDE. |
| **Fase D: Arquitectura de Tecnología** | Definición de estándares de infraestructura que soportarán el procesamiento masivo de eventos de bloqueo, colas de mensería (mTLS/Kafka) y topología de red segura. | Asegura la validación de la alta disponibilidad (99.99%) y los perímetros de ciberseguridad ante los requisitos de respuesta regulatoria en tiempo real. |
| **Fase E: Oportunidades y Soluciones** | Identificación de brechas de capacidades organizacionales y tecnológicas. Planificación de arquitecturas de transición para implementar el motor de riesgo SIPBA de forma incremental. | Estructura técnicamente los paquetes de trabajo en función de la viabilidad de inversión pública y la capacidad de absorción operativa de OSIPTEL. |
| **Fase F: Planeación de la Migración** | Coordinación presupuestal y de portafolios de TI, conectando el roadmap con el Plan Operativo Institucional (POI) y el Plan Estratégico de TI (PETI). | Garantiza el financiamiento y la sostenibilidad a mediano plazo frente a los límites presupuestales de la tarifa regulatoria. |
| **Fase G: Gobierno de la Implementación** | Supervisión del desarrollo e integración de los componentes por parte de las operadoras móviles y proveedores, mediante evaluaciones de conformidad técnica. | Monitorea que la capacidad arquitectónica mantenga el control técnico sobre el ciclo de vida de la solución, emitiendo la conformidad de diseño. |
| **Fase H: Gestión de Cambios de la Arquitectura** | Proceso formal para gestionar cambios derivados de nuevas amenazas de suplantación, variaciones en los reportes de infraestructura o actualizaciones normativas del MTC. | Asegura la evolución continua de la arquitectura y la actualización sistemática del SIB (Base de Información de Estándares). |

---

## 3. Contenido de Arquitectura a Medida

### 3.1 Entregables de Arquitectura

| FASE | ENTREGABLE DE ARQUITECTURA | DESCRIPCIÓN Y ENFOQUE OSIPTEL | ESTADO / DESTINATARIO DE APROBACIÓN |
|---|---|---|---|
| FASE PRELIMINAR | Architecture Principles | Define las reglas técnico-arquitectónicas del regulador: autonomía, transparencia de datos, fiscalización basada en riesgos e interoperabilidad. | Aprobado por el Comité de AE y visado por la GTIC |
| | Business Principles, Goals, Drivers | Formaliza el contexto estratégico y los factores de inestabilidad, quejas y datos inconsistentes que justifican la arquitectura. | Aprobado por la Gerencia de Políticas Regulatorias y Competencia (GPRC) |
| | Organisational Model for EA | Establece el alcance ampliado de la empresa (OSIPTEL), la matriz RACI de la capacidad de AE y la evaluación de madurez organizacional. | Validado por la Presidencia del Consejo Directivo |
| | Request for Architecture Work | Documento formal que solicita el inicio del ciclo ADM para el ecosistema SIPBA. | Firmado por el Presidente del Consejo Directivo y Gerente General |
| | Tailored Architecture Framework | El presente documento, que personaliza el método ADM de TOGAF 9.2 con la normativa de la SEGDI y la LPDP. | Aprobado por el Comité de AE |
| | Architecture Repository | Configuración del contenedor digital de la AE: planos de Archi, modelos BPMN, estándares regulatorios del sector telecomunicaciones. | Administrado por el Equipo Técnico de la GTIC |
| FASE A | Statement of Architecture Work | Contrato formal del proyecto SIPBA. Detalla el plan de trabajo de AE, alcance, riesgos y recursos de personal técnico y financiero. | Firmado por el Gerente General y el Arquitecto Líder |
| | Communications Plan | Plan enfocado en las necesidades de comunicación interna (gerencias) y externa (operadoras, PNP, RENIEC, ciudadanía). | Aprobado por la Gerencia de Usuarios (GU) |
| | Capability Assessment | Diagnóstico técnico de brechas en análisis de datos, automatización de quejas e integración con RENTESEG. | Aprobado por el Comité de AE |
| | Architecture Vision | Definición formal del concepto de negocio SIPBA: metas estratégicas, alcance de capacidades y beneficios esperados. | Aprobado por la Presidencia del Consejo Directivo |
| FASE B | Architecture Requirements Specification | Requisitos de negocio, datos y tecnología, incluyendo la consistencia y linaje de datos de operadoras y cumplimiento de la LPDP. | Aprobado por GFS y GU |
| | Architecture Roadmap | Cronograma maestro de transiciones tecnológicas y proyectos prioritarios del POI. | Coordinado con la Gerencia de Administración y Finanzas |
| | Architecture Definition Document | Planos detallados del estado AS-IS y TO-BE de los procesos de fiscalización, denuncias ciudadanas y reconciliación de datos. | Aprobado por GFS y GTIC |
| FASE E | Transition Architecture | Planificación de estados intermedios del sistema (ej. integración básica con operadoras y reportes transparentes manuales). | Aprobado por el Equipo de AE |
| | Implementation and Migration Plan | Plan de despliegue que articula la construcción de software con las normas de inversión pública peruana (Invierte.pe). | Aprobado por la Gerencia de Administración y Finanzas |
| FASE F | Implementation Governance Model | Estructura de gobernanza técnica sobre las células de desarrollo y proveedores de software. | Aprobado por la Jefatura de la GTIC |
| | Architecture Contract | Contrato técnico firmado por los desarrolladores y operadoras comprometiéndose a seguir los planos lógicos del API Gateway SIPBA. | Firmado entre Implementador/Operadora y el Comité de AE |
| | Architecture Building Blocks (ABB) | Componentes reutilizables: módulo de ingesta de datos, tokenizador de identidad, motor de perfiles de riesgo. | Registrado en el Repositorio de la GTIC |
| FASE G | Compliance Assessment | Certificación técnica de que los sistemas construidos respetan al 100% las directivas de seguridad e interoperabilidad de OSIPTEL. | Emitido por el Equipo de AE |
| | Solution Building Blocks | Componentes físicos del sistema SIPBA implementados y validados en producción. | Recibido con conformidad por la GTIC |
| FASE H | Requirements Impact Assessment | Evaluación del impacto arquitectónico ante nuevas modalidades de fraude, requerimientos del MTC o del Congreso. | Aprobado por el Comité de AE |
| | Change Request | Solicitud formal de cambio o evolución de la plataforma ante nuevas necesidades de la fiscalización basada en riesgos. | Aprobado por el Comité de Dirección |

### 3.2 Artefactos Arquitectónicos

Para OSIPTEL, se ha estructurado un conjunto mínimo viable de artefactos que facilitarán la visualización y auditoría:

*   **Fase Preliminar:** Principles Catalog, Organisational Model (Roles, RACI y Evaluación de Madurez).
*   **Fase A:** Driver - Goal - Objective Catalog (mapeando inestabilidad, quejas y consistencia de datos), Stakeholder Map (matriz poder/interés de gerencias y operadoras), Solution Concept Diagram.
*   **Fase B:** Process - Event - Control Catalog (procesos de fiscalización y reclamos), Actor / Role Matrix (ROF de OSIPTEL cruzado con SIPBA), Functional Decomposition Diagram.
*   **Fase C:** Data Entity - Data Component Catalog (linaje de datos sectoriales y privacidad), Logical Application Map, System Use Case Diagram.
*   **Fase D:** Technology Standards Catalog (estándares de PIDE y SEGDI), Environments and Locations Diagram (topología de red perimetral segura).

---

## 4. Herramientas del Repositorio de AE

Para soportar la gobernanza de la AE y asegurar la transparencia y trazabilidad:

*   **SharePoint / Confluence:** Almacena de manera segura la documentación formal, actas de aprobación del Comité de AE e informes de auditoría de datos, protegidos contra interferencias.
*   **Archi (ArchiMate):** Modelado oficial de las capas estratégicas, de procesos, de datos y aplicaciones de OSIPTEL.
*   **Bizagi Modeler (BPMN):** Rediseño y optimización de los flujos de fiscalización de GFS y automatización de reclamos de GU.
*   **Jira Software:** Gestión del backlog del roadmap e hitos del proyecto SIPBA.
*   **Python / Spark + Power BI:** Pipelines de procesamiento y análisis masivo para reconciliación de datos de conexiones de operadoras y visualización de indicadores de consistencia.

---

## 5. Interfaces con Marcos de Gobernanza

*   **Gobierno Digital (SEGDI / PCM):** El marco de AE de OSIPTEL se interconecta directamente con la Ley de Gobierno Digital, garantizando el uso de la PIDE para consumir datos de RENIEC y PNP, y publicando datos abiertos respetando la LPDP.
*   **Gestión de Portafolios e Inversiones:** La Hoja de Ruta de la AE define qué proyectos TI del POI e inversiones de Invierte.pe reciben luz verde, priorizando aquellos que solucionan brechas de fiscalización basada en riesgos.
*   **Gestión de Operaciones de TI (ITIL / ISO 27001):** La GTIC utiliza los planos lógicos del SIPBA para configurar los perímetros de seguridad de red y monitorear los SLAs de los webhooks de bloqueo de las operadoras móviles.
