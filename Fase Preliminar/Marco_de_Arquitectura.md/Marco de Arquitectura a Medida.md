# Marco de Arquitectura a Medida
## Proyecto OSIPTEL – Sistema de Detección y Bloqueo de Extorsión Telefónica (SIDBET)
 OSIPTEL – Organismo Supervisor de Inversión Privada en Telecomunicaciones


---

### Información del Documento

| Campo | Detalle |
|---|---|
| **Nombre del Proyecto** | Proyecto OSIPTEL – SIDBET |
| **Preparado por** | Grupo 2 – Arquitectura Empresarial |
| **No. Versión del Documento** | 1.0 |
| **Título** | Marco de Arquitectura a Medida |
| **Fecha de Versión** | Junio 2026 |
| **Revisado por** | Pendiente a verifiación |
| **Fecha de Revisión** | Pendiente |

### Lista de Distribución

| De | Fecha | Teléfono/Fax/Email |
|---|---|---|
| Grupo 2 – Arquitectura Empresarial | Junio 2026 | |

| A | Acción* | Fecha límite | Teléfono/Fax/Email |
|---|---|---|---|
| Presidencia del Consejo Directivo | Aprobar / Revisar | Por definir | presidencia@osiptel.gob.pe |
| Gerente General | Revisar | H1 | gg@osiptel.gob.pe |
| Gerente GTIC | Revisar | H1 | gtic@osiptel.gob.pe |
| Gerente GFS | Informar | H1 | gfs@osiptel.gob.pe |



### Historial de Versiones del Documento

| Ver. No. | Ver. Fecha | Revisado por | Descripción | Nombre del archivo |
|---|---|---|---|---|
| 1.0 | Jun 2026 | Grupo 2 | Adapta TOGAF 9 al OSIPTEL para el Sistema de Detección y Bloqueo de Extorsión Telefónica (SIDBET), alineando el marco con la normativa regulatoria peruana de telecomunicaciones. | TOGAF - Tailored Architecture Framework (OSIPTEL) |

---

## 1. Propósito del Documento

Este documento formaliza el Marco de Arquitectura Adaptado (Tailored Architecture Framework) para el Organismo Supervisor de Inversión Privada en Telecomunicaciones (OSIPTEL) del Perú, específicamente adaptado para el diseño, gobernanza e implementación del **Sistema de Detección y Bloqueo de Extorsión Telefónica (SIDBET)**. La creciente prevalencia de la extorsión telefónica en el Perú, que afecta a ciudadanos, empresas y al propio Estado, exige que OSIPTEL, en coordinación con las operadoras móviles y el MININTER, despliegue una respuesta tecnológica robusta y regulatoriamente fundamentada.

La naturaleza del sector público regulatorio y la complejidad técnica de una solución basada en análisis masivo de registros de llamadas (CDR), inteligencia artificial y la integración con el Registro Nacional de Terminales de Telecomunicaciones para la Seguridad (RENTESEG), exigen que el marco estándar TOGAF 9 sea personalizado en dos niveles estratégicos:

- **Adaptación a Nivel de la Entidad (Institucional):** Sincroniza el Método de Desarrollo de la Arquitectura (ADM) con el marco normativo del Estado Peruano, incluyendo la Ley de Telecomunicaciones (TUO D.S. 013-93-TCC), la Ley de Delitos Informáticos (Ley N.° 30096), la Ley de Protección de Datos Personales (Ley N.° 29733), las directrices de la Secretaría de Gobierno y Transformación Digital (SEGDI) y la Ley de Gobierno Digital (DL 1412).

- **Adaptación a Nivel de Proyecto:** Estructura un conjunto ágil y eficiente de entregables y artefactos de arquitectura, evitando burocracia documental y enfocándose en las necesidades reales de OSIPTEL, las operadoras móviles (Claro, Movistar, Entel, Bitel) y la PNP-DIVINDAT para detectar, bloquear y perseguir penalmente la extorsión telefónica.

---

## 2. Método de Arquitectura a Medida

### 2.1 Método de Arquitectura

OSIPTEL adopta el ciclo ADM (Architecture Development Method) de TOGAF 9 como base metodológica, integrando puntos de control obligatorios asociados a la gobernanza regulatoria y la viabilidad de inversiones en la administración pública.

| FASE DEL ADM TOGAF | DESCRIPCIÓN ADAPTADA OSIPTEL | PROPÓSITO DEL CONTROL DE CAPACIDADES |
|---|---|---|
| **Fase Preliminar** | Establecimiento de la capacidad de AE dentro de la GTIC. Definición del modelo organizativo, límites y principios institucionales que guiarán la lucha contra la extorsión telefónica en el sector telecomunicaciones. | Establece la línea base de gobernanza, las reglas de juego institucionales y los marcos adaptados antes de iniciar el ciclo ADM. |
| **Fase A: Visión de la Arquitectura** | Alineación estratégica con el PEI 2024-2028, la Política Nacional Multisectorial de Seguridad Digital y las directivas de la SEGDI. Validación de interesados (Alta Dirección OSIPTEL, PNP-DIVINDAT, MININTER, operadoras móviles). | Punto de evaluación formal del Capability Assessment, madurez institucional y validación de la iniciativa digital para combatir la extorsión telefónica. |
| **Fase B: Arquitectura de Negocio** | Modelado y rediseño de procesos regulatorios y de fiscalización de telecomunicaciones usando notación BPMN. Mapeo de capacidades institucionales para detección temprana de números utilizados en extorsión. | Identifica la preparación operativa de las gerencias (GFS, GTIC, GPRC) para absorber los nuevos modelos de trabajo colaborativo con operadoras y PNP. |
| **Fase C: Arquitecturas de Sistemas de Información** | Estructuración de datos y planos de aplicaciones. En Datos, integración de fuentes: RENTESEG, registros IMEI, CRM de operadoras y base de denuncias PNP. En Aplicaciones, diseño del sistema analítico de detección de patrones de extorsión. | Evalúa la madurez de los datos (calidad, gobierno de datos) y la interoperabilidad de los sistemas, en especial con la Plataforma de Interoperabilidad del Estado (PIDE). |
| **Fase D: Arquitectura de Tecnología** | Definición de estándares de infraestructura que soportarán el procesamiento masivo de metadatos de llamadas (CDR), bloqueo de IMEI y análisis en tiempo real de patrones de extorsión telefónica. | Asegura la validación de la capacidad técnica, topología de red segura y perímetros de seguridad de la información ante los requisitos regulatorios del sistema. |
| **Fase E: Oportunidades y Soluciones** | Identificación de brechas organizacionales y tecnológicas. Evaluación de opciones para construir o adquirir el sistema de detección de extorsión y definición de arquitecturas de transición. | Estructura técnicamente los paquetes de trabajo en función de la viabilidad constructiva, financiera y técnica de OSIPTEL. |
| **Fase F: Planeación de la Migración** | Articulación presupuestal y priorización de proyectos. Traducción de la Hoja de Ruta de Arquitectura en mecanismos de inversión pública alineados al presupuesto institucional y a los compromisos con el MININTER. | Garantiza que la planificación financiera y de TI esté alineada con las normativas presupuestales y con los plazos de respuesta regulatoria. |
| **Fase G: Gobierno de la Implementación** | Supervisión arquitectónica del desarrollo o adquisición del sistema. Verificación de que proveedores externos cumplan estrictamente las especificaciones del marco adaptado y los planos de diseño. | Monitorea que la capacidad arquitectónica mantenga el control técnico sobre el ciclo de vida de la solución, emitiendo la conformidad de diseño. |
| **Fase H: Gestión de Cambios de la Arquitectura** | Establecimiento de un proceso formal para gestionar cambios derivados de nuevas modalidades de extorsión, modificaciones normativas del MTC o evoluciones en la tecnología de telecomunicaciones. | Asegura la evolución continua del sistema y la actualización sistemática del repositorio de arquitectura ante el dinamismo del delito de extorsión telefónica. |

---

## 3. Contenido de Arquitectura a Medida

### 3.1 Entregables de Arquitectura

| FASE | ENTREGABLE DE ARQUITECTURA | DESCRIPCIÓN Y ENFOQUE OSIPTEL | ESTADO / DESTINATARIO DE APROBACIÓN |
|---|---|---|---|
| FASE PRELIMINAR | Architecture Principles | Define las reglas técnico-arquitectónicas para el sistema anti-extorsión: privacidad por diseño, interoperabilidad con operadoras, trazabilidad de denuncias. | Aprobado por el Comité de Arquitectura y visado por la GTIC |
| | Business Principles, Goals, Drivers | Formaliza el contexto estratégico (PEI 2024-2028) y los factores del entorno (incremento de extorsiones telefónicas) que justifican la solución. | Aprobado por la Gerencia de Políticas Regulatorias y Competencia (GPRC) |
| | Organisational Model for EA | Establece el alcance del proyecto, la matriz RACI de la capacidad de AE y la evaluación de madurez institucional frente al problema. | Validado por la Presidencia del Consejo Directivo |
| | Request for Architecture Work | Documento formal que solicita el inicio del ciclo ADM para el Sistema de Detección y Bloqueo de Extorsión Telefónica (SIDBET). | Firmado por el Presidente del Consejo Directivo |
| | Tailored Architecture Framework | Formaliza la personalización del método ADM de TOGAF 9 con la normativa regulatoria peruana de telecomunicaciones. | Aprobado por el Gerente de la GTIC |
| | Architecture Repository | Configuración del contenedor de la memoria institucional de AE: planos, catálogos, estándares regulatorios del sector. | Administrado por el Equipo Técnico de la GTIC |
| FASE A | Statement of Architecture Work | Gatillador formal del SIDBET. Detalla el plan de trabajo, cronograma, responsabilidades y recursos para el diseño. | Firmado entre el Patrocinador Ejecutivo y el Arquitecto Líder |
| | Communications Plan | Plan enfocado en las necesidades informativas de las gerencias, operadoras móviles, PNP-DIVINDAT y ciudadanía afectada. | Aprobado por el Comité de Dirección del Sistema |
| | Capability Assessment | Diagnóstico técnico de brechas en análisis de CDR, integración con RENTESEG y capacidades de respuesta en tiempo real. | Aprobado por la Gerencia General / GTIC |
| | Architecture Vision | Definición formal del concepto SIDBET: metas estratégicas, alcance operativo, riesgos y beneficios regulatorios esperados. | Aprobado por la Presidencia del Consejo Directivo |
| FASE B | Architecture Requirements Specification | Requisitos funcionales y no funcionales: análisis de patrones CDR, integración RENTESEG-IMEI, cumplimiento Ley 29733 y Ley 30096. | Aprobado por la Gerencia de Fiscalización y Supervisión (GFS) |
| | Architecture Roadmap | Cronograma maestro de transiciones tecnológicas por paquetes de trabajo y horizontes temporales. | Revisado con la Gerencia de Administración y Finanzas para alineación presupuestal |
| | Architecture Definition Document | Plano consolidado con modelos As-Is y To-Be de los procesos de supervisión, denuncia y bloqueo de números extorsionadores. | Aprobado por GFS y GTIC |
| FASE E | Transition Architecture | Estado intermedio del sistema: integración parcial con operadoras y habilitación del módulo de denuncia ciudadana. | Aprobado por el Equipo de Arquitectura Empresarial |
| | Implementation and Migration Plan | Plan de despliegue articulando la construcción de TI con las exigencias de inversión pública y coordinación interinstitucional. | Aprobado por la Gerencia de Administración y Finanzas |
| FASE F | Implementation Governance Model | Estructura de gobernanza sobre las células de desarrollo y proveedores durante la construcción del SIDBET. | Aprobado por la Jefatura de la GTIC |
| | Architecture Contract | Acuerdo formal que los implementadores firman comprometiéndose a respetar los planos del ADD y las normativas de telecomunicaciones. | Firmado entre Proveedor/Desarrollador y el Comité de AE |
| | Architecture Building Blocks (ABB) | Componentes reutilizables: módulo de ingesta CDR, APIs de interoperabilidad con RENTESEG, motor de reglas de detección de extorsión. | Registrado en el Repositorio Central por el Equipo de AE |
| FASE G | Compliance Assessment | Certifica que los desarrollos del proveedor respetan al 100% los planos de diseño y los requisitos regulatorios. | Emitido por el Equipo de AE y aprobado por la Jefatura de la GTIC |
| | Solution Building Blocks | Componentes físicos implementados del SIDBET en producción. | Recibido con conformidad por la Oficina de Operaciones de la GTIC |
| FASE H | Requirements Impact Assessment | Evaluación del impacto técnico ante nuevas modalidades de extorsión o cambios normativos del MTC. | Aprobado por el Equipo de Arquitectura Empresarial |
| | Change Request | Solicitud formal de modificación o evolución del SIDBET ante nuevas amenazas del delito de extorsión telefónica. | Aprobado por el Comité de Dirección (nivel estratégico) |

### 3.2 Artefactos Arquitectónicos

Para el OSIPTEL, se ha seleccionado un conjunto mínimo viable de artefactos que facilitarán el análisis técnico del SIDBET sin burocratizar los procesos de diseño:

| FASE | ARTEFACTO | PROPÓSITO METODOLÓGICO EN EL PROYECTO OSIPTEL |
|---|---|---|
| FASE PRELIMINAR | Principles Catalog | Inventario de reglas institucionales (PRIN-01 al PRIN-08): interoperabilidad con operadoras, seguridad de datos CDR, privacidad por diseño, trazabilidad regulatoria. |
| FASE A | Driver - Goal - Objective Catalog | Mapeo de factores del entorno (DR-01 al DR-06): incremento de extorsiones, debilidad en trazabilidad de SIM, y su relación directa con los objetivos del SIDBET. |
| | Stakeholder Map - Matrix | Identificación de interés e influencia de los actores: Presidencia OSIPTEL, GFS, GTIC, operadoras móviles, PNP-DIVINDAT, MININTER, ciudadanía afectada. |
| | Solution Concept Diagram | Representación gráfica de cómo se integran los CDR, datos RENTESEG e IMEI para detectar patrones de extorsión y generar alertas en tiempo real. |
| FASE B | Process - Event - Control - Product Catalog | Inventario de procesos operativos de supervisión y fiscalización de telecomunicaciones bajo el enfoque de Modernización del Estado. |
| | Actor / Role Map - Matrix | Cruza el ROF del OSIPTEL con los roles que operarán el SIDBET: fiscalizadores, analistas de datos, coordinadores con PNP. |
| | Functional Decomposition Diagram | Desglose de capacidades funcionales del OSIPTEL asociadas a la supervisión de operadoras, detección de patrones y respuesta regulatoria. |
| FASE C | Data Entity - Data Component Catalog | Listado de entidades de datos críticas: CDR de llamadas, registros IMEI, datos RENTESEG, denuncias ciudadanas, con niveles de privacidad (Ley 29733). |
| | Logical Application Components Map to Data Entities | Matriz CRUD: qué componente crea, lee, actualiza o elimina entidades de datos compartidas entre OSIPTEL y las operadoras. |
| | System Use Case Diagram | Casos de uso: fiscalizador OSIPTEL consulta patrón CDR, ciudadano reporta número extorsionador, analista GTIC bloquea IMEI. |
| | Data Dissemination Diagram | Flujos de intercambio de información entre los sistemas de origen (CDR operadoras, RENTESEG) y el repositorio unificado del SIDBET. |
| FASE D | Technology Standards Catalog | Inventario de hardware, bases de datos, software base y servicios cloud autorizados en la infraestructura del Estado (NubePE). |
| | Logical Application / Technology Components Map | Mapea la infraestructura de servidores y contenedores que soportan la ejecución del motor analítico del SIDBET. |
| | Environments and Locations Diagram | Topología de red, centros de datos de OSIPTEL, entornos en la nube, perímetros de seguridad y localización de los nodos de integración con operadoras. |

---

## 4. Herramientas Configuradas e Implementadas

### 4.1 Herramientas

Para asegurar un Repositorio Central de Arquitectura sólido, transparente y con estricto control de accesos, la GTIC de OSIPTEL ha oficializado y desplegado las siguientes plataformas tecnológicas:

| CATEGORÍA DE HERRAMIENTA | SOFTWARE SELECCIONADO | PROPÓSITO EN OSIPTEL | INTEGRACIÓN EN LA GOBERNANZA |
|---|---|---|---|
| Repositorio Central de AE | Confluence / SharePoint | Contenedor oficial del Repositorio de AE. Almacena marcos adaptados, actas del Comité de Arquitectura, estándares regulatorios del sector telecomunicaciones. | Control de accesos centralizado con credenciales institucionales de la GTIC, asegurando auditoría completa. |
| Gestor Documental de Entregables | Microsoft SharePoint | Almacenamiento y control de versiones formales de entregables firmados (Statements of Work, ADDs, Hojas de Ruta). | Soporta flujos de aprobación mediante firmas digitales del Comité de Arquitectura y la Presidencia del Consejo Directivo. |
| Modelado de AE | Archi (ArchiMate) | Diagramación y visualización del modelo de arquitectura en sus capas de negocio, aplicaciones, datos y tecnología para el SIDBET. | Mapea directamente las dependencias entre servicios de supervisión regulatoria y la infraestructura de análisis de CDR. |
| Modelado de Procesos de Negocio | Bizagi Modeler | Mapeo y rediseño de los flujos de procesos de fiscalización y supervisión de telecomunicaciones bajo el estándar BPMN. | Habilita a los analistas de la GFS y GTIC para definir los flujos As-Is y To-Be del proceso de detección de extorsión. |
| Gestión de Proyectos de TI | Jira Software | Seguimiento ágil de tareas del equipo de arquitectura y células de desarrollo del SIDBET. | Gestiona el avance del ciclo ADM, asignación de responsables por artefacto y medición de avances en tiempo real. |
| Análisis de CDR e Inteligencia | Python / Spark + Power BI | Plataforma de procesamiento masivo de registros de llamadas (CDR), detección de patrones de extorsión y visualización de alertas. | Integrada con la GTIC para proveer inteligencia en tiempo real a los fiscalizadores y coordinadores PNP-DIVINDAT. |
| Monitoreo e Indicadores | Power BI | Tablero de control analítico para métricas de adopción de la AE, cumplimiento de principios institucionales y avance del SIDBET. | Mide indicadores de reducción de extorsión, tiempo de respuesta regulatoria y nivel de integración con operadoras. |

---

## 5. Interfaces con Modelos y Marcos de Gobernanza

### 5.1 Marco de Gestión de la Arquitectura Empresarial

**Descripción:** Regido directamente por el Comité de Arquitectura Empresarial de OSIPTEL, liderado por la Gerencia de Tecnologías de la Información y Comunicaciones (GTIC). Utiliza el ciclo ADM adaptado como proceso estándar para guiar la transformación regulatoria y tecnológica del sector telecomunicaciones.

**Mecanismo de Interfaz:** Evaluaciones de conformidad arquitectónica y aprobaciones formales de los Documentos de Definición de Arquitectura (ADD) antes de viabilizar cualquier desarrollo de software, adquisición tecnológica o directiva regulatoria relacionada con el combate a la extorsión telefónica.

### 5.2 Marco de Gestión de Capacidades

**Descripción:** Se enfoca en medir y elevar el nivel de preparación, madurez y capacidades operativas, humanas y tecnológicas de OSIPTEL en materia de análisis de datos de telecomunicaciones, ciberseguridad y coordinación interinstitucional con PNP-DIVINDAT y operadoras.

**Mecanismo de Interfaz:** La Arquitectura Empresarial provee las métricas organizacionales y modelos de procesos que sirven como insumo directo para el diagnóstico institucional. Habilita el entorno estandarizado para que en la Fase A se ejecute de manera óptima el Capability Assessment, identificando brechas específicas en análisis de CDR y gobierno de datos.

### 5.3 Marco de Gestión de Portafolio

**Descripción:** Encargado de la priorización y asignación de presupuesto a las iniciativas de TI que generan mayor valor regulatorio y atienden las demandas más críticas del sector en materia de seguridad ciudadana y telecomunicaciones.

**Mecanismo de Interfaz:** La Hoja de Ruta de la Arquitectura (Architecture Roadmap) se conecta con el Plan Estratégico de Tecnologías de la Información (PETI) y el Plan Operativo Institucional (POI) gestionados por la Gerencia de Administración y Finanzas, garantizando soporte e impacto arquitectónico previo a la asignación de fondos para el SIDBET.

### 5.4 Marco de Gestión de Proyectos

**Descripción:** Articulado bajo las buenas prácticas del PMBOK y las directivas obligatorias del Sistema Nacional de Programación Multianual y Gestión de Inversiones (Invierte.pe) para la ejecución eficiente de proyectos públicos en el sector regulatorio.

**Mecanismo de Interfaz:** Antes de que un proyecto de TI inicie su fase de formulación de expediente técnico, la GTIC emite los requisitos de arquitectura que los desarrolladores o proveedores deben seguir obligatoriamente mediante los Términos de Referencia (TDR) con criterios de AE, garantizando que el SIDBET no herede problemas de diseño y cumpla con la normativa de interoperabilidad con operadoras.

### 5.5 Marco de Gestión de Operaciones

**Descripción:** Basado en las buenas prácticas de ITIL para la gestión de servicios de TI y la norma ISO 27001 para la seguridad de la información institucional, una vez que el SIDBET entre en producción y opere en tiempo real con los datos de las operadoras móviles.

**Mecanismo de Interfaz:** El Equipo de Arquitectura entrega los planos lógicos y tecnológicos del SIDBET "como se construyó" (As-Built) a la Oficina de Operaciones de la GTIC. Esto permite mantener actualizado el Catálogo de Aplicaciones e Integraciones activas con las operadoras y gestionar el impacto de incidentes, cambios normativos o nuevas modalidades del delito de extorsión telefónica.

---
