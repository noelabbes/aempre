# Principios de Arquitectura: Proyecto SIPBA

Los principios de arquitectura definen las reglas y lineamientos fundamentales que rigen el diseño y la evolución de la Arquitectura Empresarial de Osiptel para el proyecto SIPBA. Estos principios son innegociables y aseguran la alineación entre la tecnología y los objetivos estratégicos de erradicación del fraude.

---

## 1. Seguridad y No Repudio sobre Agilidad Comercial
*   **Declaración:** La integridad del ecosistema de identidad móvil es la prioridad absoluta. Ninguna transacción de activación o reposición de SIM procederá si no cumple con los protocolos de validación biométrica y reglas de negocio, sin excepciones manuales.
*   **Razón (Rationale):** El objetivo primordial es erradicar el anonimato y el fraude por suplantación (SIM Swapping). La flexibilidad comercial en el pasado ha facilitado el crimen organizado; por lo tanto, la seguridad debe ser el filtro mandatorio.
*   **Implicancias:**
    *   Las operadoras deben integrar obligatoriamente los controles de "Liveness Detection".
    *   Se podrían experimentar rechazos de ventas legítimas si el usuario no supera los umbrales de seguridad.
    *   No existen flujos de "activación en diferido" para casos donde falle la conectividad con el Hub.

## 2. Privacidad por Diseño y Custodia Federada
*   **Declaración:** Osiptel actúa como orquestador y auditor del proceso de validación, pero no almacena ni custodia imágenes o vectores biométricos crudos de la ciudadanía.
*   **Razón (Rationale):** Minimizar la superficie de riesgo legal y técnico frente a la Ley de Protección de Datos Personales (LPDP). RENIEC es la única fuente oficial de identidad; Osiptel solo requiere la evidencia (Token/Score) del éxito de la validación.
*   **Implicancias:**
    *   El RENTESEG solo almacenará metadatos de auditoría (`Token_de_Verificacion`, `Timestamp`, `Score`).
    *   La arquitectura debe garantizar el cifrado de extremo a extremo durante el tránsito de datos sensibles.

## 3. Interoperabilidad Estandarizada Perimetral
*   **Declaración:** La integración con el SIPBA se realiza exclusivamente a través de estándares abiertos y protocolos definidos en el perímetro de Osiptel (APIs REST, JSON, mTLS), manteniendo total agnosticismo sobre el core tecnológico de las operadoras.
*   **Razón (Rationale):** Permite una integración rápida y escalable con múltiples operadoras (Claro, Movistar, Entel, Bitel) sin interferir en sus infraestructuras internas ni imponer tecnologías propietarias.
*   **Implicancias:**
    *   Las operadoras son responsables de adaptar sus sistemas internos para consumir las APIs del Hub SIPBA.
    *   Cualquier cambio en el core de una operadora no debe afectar su cumplimiento con el estándar de interoperabilidad de Osiptel.

## 4. Cooperación Interinstitucional en Tiempo Real
*   **Declaración:** La información sobre fraude y extorsión debe fluir sin silos entre Osiptel, la PNP y RENIEC, operando bajo una arquitectura orientada a eventos (EDA).
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
