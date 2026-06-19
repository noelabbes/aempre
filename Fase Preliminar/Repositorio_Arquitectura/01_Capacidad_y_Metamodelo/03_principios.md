# Principios de Arquitectura: Proyecto SIPBA - OSIPTEL

Los principios de arquitectura definen las reglas y lineamientos fundamentales que rigen el diseño y la evolución de la Arquitectura Empresarial de OSIPTEL. Estos principios son innegociables y aseguran la alineación entre la tecnología, la regulación del mercado y los objetivos estratégicos de erradicación del fraude, protección al usuario y transparencia del sector.

---

## 1. Seguridad y No Repudio sobre Agilidad Comercial
*   **Declaración:** La integridad del ecosistema de identidad móvil es la prioridad absoluta. Ninguna transacción de activación o reposición de SIM procederá si no cumple con los protocolos de validación biométrica y reglas de negocio, sin excepciones manuales.
*   **Razón (Rationale):** El objetivo primordial es erradicar el anonimato y el fraude por suplantación (SIM Swapping). La flexibilidad comercial en el pasado ha facilitado el crimen organizado; por lo tanto, la seguridad debe ser el filtro mandatorio.
*   **Implicancias:**
    *   Las operadoras deben integrar obligatoriamente los controles de "Liveness Detection".
    *   Se podrían experimentar rechazos de ventas legítimas si el usuario no supera los umbrales de seguridad.
    *   No existen flujos de "activación en diferido" para casos donde falle la conectividad con el Hub.

## 2. Privacidad por Diseño y Custodia Federada
*   **Declaración:** OSIPTEL actúa como orquestador y auditor del proceso de validación, pero no almacena ni custodia imágenes o vectores biométricos crudos de la ciudadanía.
*   **Razón (Rationale):** Minimizar la superficie de riesgo legal y técnico frente a la Ley de Protección de Datos Personales (LPDP). RENIEC es la única fuente oficial de identidad; OSIPTEL solo requiere la evidencia (Token/Score) del éxito de la validación.
*   **Implicancias:**
    *   El RENTESEG solo almacenará metadatos de auditoría (`Token_de_Verificacion`, `Timestamp`, `Score`).
    *   La arquitectura debe garantizar el cifrado de extremo a extremo durante el tránsito de datos sensibles.

## 3. Interoperabilidad Estandarizada Perimetral
*   **Declaración:** La integración con el SIPBA se realiza exclusivamente a través de estándares abiertos y protocolos definidos en el perímetro de OSIPTEL (APIs REST, JSON, mTLS), manteniendo total agnosticismo sobre el core tecnológico de las operadoras.
*   **Razón (Rationale):** Permite una integración rápida y escalable con múltiples operadoras (Claro, Movistar, Entel, Bitel) sin interferir en sus infraestructuras internas ni imponer tecnologías propietarias.
*   **Implicancias:**
    *   Las operadoras son responsables de adaptar sus sistemas internos para consumir las APIs del Hub SIPBA.
    *   Cualquier cambio en el core de una operadora no debe afectar su cumplimiento con el estándar de interoperabilidad de OSIPTEL.

## 4. Cooperación Interinstitucional en Tiempo Real
*   **Declaración:** La información sobre fraude y extorsión debe fluir sin silos entre OSIPTEL, la PNP y RENIEC, operando bajo una arquitectura orientada a eventos (EDA).
*   **Razón (Rationale):** La efectividad contra el crimen organizado depende de la velocidad de respuesta. Un bloqueo que tarda 24 horas es ineficaz; la integración directa permite acciones inmediatas tras la denuncia.
*   **Implicancias:**
    *   Se requiere alta disponibilidad (99.99%) en las interfaces de conexión con la PNP y RENIEC.
    *   Establecimiento de acuerdos de niveles de servicio (OLA) entre las instituciones del Estado.

## 5. Eficiencia Operativa y Alto Rendimiento
*   **Declaración:** Los controles de seguridad no deben exceder una latencia de validación perimetral de 3 segundos para garantizar una experiencia de usuario aceptable.
*   **Razón (Rationale):** Si bien la seguridad es prioritaria, un sistema excesivamente lento provocaría el abandono masivo de transacciones legales y afectaría el mercado de telecomunicaciones.
*   **Implicancias:**
    *   Inversión en infraestructura de alta velocidad y optimización de algoritmos de procesamiento de vectores.
    *   Monitoreo constante de los tiempos de respuesta de RENIEC como dependencia crítica.

## 6. Autonomía Tecnológica y Continuidad Operativa
*   **Declaración:** La Arquitectura Empresarial y sus plataformas tecnológicas críticas se diseñarán con total independencia de las fluctuaciones políticas externas y la rotación en la alta dirección de OSIPTEL.
*   **Razón (Rationale):** Las amenazas externas de control político o cambios continuos en el liderazgo institucional ponen en riesgo la continuidad de los servicios de supervisión. La AE debe garantizar que las reglas técnicas y operativas sigan un modelo estandarizado y meritocrático.
*   **Implicancias:**
    *   Los roles de gobernanza de la AE deben estar vinculados a cargos técnicos estructurales y no a nombramientos de confianza política.
    *   El Repositorio de AE y el SIB serán la memoria técnica oficial de la institución, reduciendo el impacto por pérdida de conocimiento ante rotación de personal.

## 7. Transparencia y Veracidad del Dato Regulatorio
*   **Declaración:** Toda información, estadística o métrica reportada al mercado (conexiones, líneas activas, portabilidad) debe tener un linaje de datos claro, ser auditable, consistente y estar libre de discrepancias inexplicadas.
*   **Razón (Rationale):** OSIPTEL debe mantener la máxima credibilidad ante el mercado e inversionistas. Las caídas abruptas o inconsistencias en los datos reportados de los operadores (como el caso de la operadora WOW en 2026) generan incertidumbre. La arquitectura de datos debe garantizar la precisión y la auditoría cruzada en origen.
*   **Implicancias:**
    *   Implementación de pipelines de datos integrados (ETL/ELT) con reglas automáticas de validación de calidad y reconciliación de cifras de conexiones.
    *   Obligación de que los reportes al público y a inversionistas incluyan notas metodológicas y desgloses de variación auditables.

## 8. Fiscalización y Supervisión Basada en Riesgos
*   **Declaración:** Los procesos de fiscalización regulatoria de OSIPTEL deben automatizarse y priorizar la atención según niveles de riesgo y anomalías estadísticas detectadas por el sistema, en lugar de realizar auditorías manuales masivas o aleatorias.
*   **Razón (Rationale):** Las limitaciones presupuestarias e institucionales exigen optimizar el uso de los recursos humanos y financieros. El regulador debe actuar de manera predictiva e inteligente.
*   **Implicancias:**
    *   Desarrollo de modelos analíticos en el core de SIPBA para calcular puntuaciones de riesgo (Risk Scoring) de distribuidores y operadoras.
    *   La GFS basará sus campañas de supervisión física en el ranking de riesgo generado por el sistema analítico.

## 9. Enfoque Centrado en el Ciudadano en la Gestión de Reclamos
*   **Declaración:** La arquitectura del sistema de atención de reclamos y denuncias de usuarios debe estar unificada, simplificada y diseñada para manejar de forma automatizada y escalable flujos masivos de quejas.
*   **Razón (Rationale):** OSIPTEL recibe más de 1.25 millones de reclamos anuales. La única forma de dar respuesta eficiente sin saturar el presupuesto institucional es automatizar los flujos comunes de reclamos (facturación y calidad) y descentralizar la recepción mediante canales digitales integrados.
*   **Implicancias:**
    *   Integración de los canales de denuncia de la PNP directamente con los flujos de bloqueo de SIPBA.
    *   Habilitación de APIs de autoservicio y consultas para que los ciudadanos conozcan el estado en tiempo real de sus líneas y bloqueos.
