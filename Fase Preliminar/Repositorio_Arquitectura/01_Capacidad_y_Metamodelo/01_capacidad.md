# Capacidad de Arquitectura (Architecture Capability)

Define la estructura organizativa, roles, responsabilidades y el alcance de la empresa requeridos para la gobernanza y mantenimiento de la Arquitectura Empresarial (AE) de OSIPTEL.

---

## 1. Alcance de la Empresa (Scope of the Enterprise)

Para superar un enfoque puramente de producto tecnológico (SIPBA), el "alcance de la empresa" para este marco de AE abarca a **OSIPTEL en su rol de regulador y supervisor**, estructurado en cuatro niveles organizacionales:

1.  **Núcleo (Core):**
    *   **GTIC (Gerencia de Tecnologías de la Información y Comunicaciones):** Responsable de la infraestructura tecnológica, ciberseguridad e integración de APIs.
    *   **GFS (Gerencia de Supervisión y Fiscalización):** Responsable de la supervisión de las operadoras en campo y del cumplimiento de las normas de bloqueo y RENTESEG.
2.  **Suave (Soft Impacted):**
    *   **GPRC (Gerencia de Políticas Regulatorias y Competencia):** Diseña las normas y recolecta estadísticas de mercado.
    *   **GU (Gerencia de Usuarios) & TRASU:** Encargados de la recepción, canalización y resolución de la alta carga de reclamos de usuarios.
3.  **Comunidad:**
    *   **Ciudadanía / Usuarios de Telecomunicaciones:** Los beneficiarios finales que experimentan la seguridad y registran quejas.
    *   **Distribuidores y Puntos de Venta de Operadores:** Actores clave que ejecutan las transacciones en el borde comercial.
4.  **Extendido:**
    *   **Entidades Públicas Externas:** RENIEC (validación de identidad) y la PNP (recepción de denuncias de extorsión).
    *   **Operadoras de Telecomunicaciones:** Claro, Movistar, Entel y Bitel.
    *   **Gobierno Central (PCM - SEGDI):** Ente rector del gobierno digital en el Perú.

---

## 2. Estructura y Roles del Architecture Board (Comité de Arquitectura)

El *Architecture Board* es el cuerpo colegiado encargado de supervisar y guiar la implementación de la AE. Su estructura garantiza la gobernanza descentralizada para proteger el diseño técnico ante la rotación de directivos:

*   **Presidente del Comité de AE:** Liderado por el Gerente de la GTIC, con voto dirimente sobre decisiones tecnológicas.
*   **Representante de Fiscalización (GFS):** Garantiza que las soluciones tecnológicas se alineen con la capacidad fiscalizadora en campo.
*   **Representante de Políticas (GPRC):** Asegura el cumplimiento legal y normativo, y coordina las consultas tempranas a stakeholders.
*   **Representante de Usuarios (GU):** Vela por que la arquitectura simplifique el canal de atención de reclamos.
*   **Oficial de Seguridad de la Información:** Encargado de la protección de datos personales (Ley 29733) y gobernanza de accesos.

### Roles Críticos de Arquitectura

| Rol | Unidad Orgánica | Responsabilidad Clave en la Capacidad |
| :--- | :--- | :--- |
| **Arquitecto de Integración y APIs** | GTIC | Gobernar el API Gateway del SIPBA y el flujo transaccional. |
| **Arquitecto de Datos y Analítica** | GTIC | Garantizar el linaje y consistencia de los datos del sector, evitando discrepancias en los reportes públicos. |
| **Oficial de Privacidad y Custodia** | GTIC / GPRC | Asegurar el cumplimiento de la LPDP y el no almacenamiento de datos biométricos sensibles crudos en OSIPTEL. |
| **Especialista en Ciberseguridad (IAM)** | GTIC | Gestión de identidades, certificados perimetrales (mTLS) y tokens de interoperabilidad. |
| **Analista de Negocio y Procesos** | GFS / GU | Modelar flujos regulatorios y flujos de reclamos automatizados bajo el estándar BPMN. |

---

## 3. Matriz de Asignación de Responsabilidades (RACI Expandida)

Establece cómo se distribuyen las responsabilidades de gobernanza en la AE de OSIPTEL:

| Actividad de Gobernanza | Comité de AE | GTIC | GFS | GPRC | GU | Operadoras / Externos |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| **Aprobar Principios de AE** | **A** | R | C | C | C | I |
| **Mantener el Repositorio de AE** | C | **A** / R | I | I | I | I |
| **Revisar proyectos y expedientes** | **A** | R | R | C | C | I |
| **Aprobar excepciones técnicas** | **A** | R | C | I | I | C |
| **Asegurar Calidad del Dato del Sector**| C | R | **A** | R | I | C |
| **Gobernar el Flujo de Reclamos** | I | R | C | C | **A** | I |

* Leyenda: **A** = Accountable (Aprobador) | **R** = Responsible (Ejecutor) | **C** = Consulted (Consultado) | **I** = Informed (Informado).*

---

## 4. Procesos de Gestión y Gobernanza

*   **Mantenimiento del Repositorio:** La GTIC realizará auditorías semestrales para asegurar la consistencia y actualización de los entregables en el SIB (Standards Information Base).
*   **Gestión de Excepciones Regulatorias:** Si se produce un cambio de emergencia normado por el MTC o la PCM, el Comité de AE evaluará y documentará el impacto en la arquitectura de transición antes de autorizar modificaciones al SIPBA.
*   **Gobernanza de Datos:** Cualquier discrepancia en las estadísticas sectoriales reportadas (ej. caídas de líneas) gatillará un proceso de auditoría de datos coordinado por GFS y ejecutado a través de los pipelines de datos integrados en el repositorio de la AE.

---

## 5. Evaluación de Madurez de la Capacidad (Maturity Assessment)

Definimos la línea base y la meta a 12 meses para la capacidad de AE dentro de OSIPTEL:

| Dimensión de Madurez | Estado Actual (AS-IS) | Meta (TO-BE a 12m) | Estrategia de Cierre de Brecha |
| :--- | :---: | :---: | :--- |
| **Gobierno de Arquitectura** | Nivel 1 (Ad-hoc) | Nivel 3 (Definido) | Institucionalizar el Comité de AE y aprobar sus directivas en el ROF de OSIPTEL. |
| **Metodología (ADM)** | Nivel 1.5 (Inicial) | Nivel 3 (Establecido) | Adaptar y aplicar formalmente el ciclo ADM en los proyectos core (SIPBA, RENTESEG). |
| **Repositorio y Herramientas**| Nivel 0.5 (Inexistente)| Nivel 2.5 (Operativo) | Desplegar Confluence/SharePoint e integrarlo con modelado en Archi (ArchiMate). |
| **Calidad de Datos Sectoriales**| Nivel 1.0 (Bajo) | Nivel 3.0 (Auditable) | Implementar validaciones automatizadas de datos de operadoras en el API Gateway. |
