# Registro de Decisiones de Arquitectura (Architecture Decision Log)

Este documento registra las decisiones arquitectónicas clave, sus justificaciones y el contexto en el que fueron tomadas para asegurar la trazabilidad y coherencia del diseño SIPBA.

## ADR 001: Implementación de API Gateway Centralizado

### Estatus
Aprobado

### Contexto
Se evaluó la posibilidad de un modelo federado donde cada operadora gestionara su propia integración con RENIEC y PNP. Sin embargo, esto fragmentaba la visibilidad de Osiptel sobre las activaciones críticas y dificultaba la aplicación de reglas transversales (como el límite de 7 líneas por DNI).

### Decisión
Se optó por un **API Gateway Centralizado** operado por Osiptel para actuar como el único punto de entrada y salida del ecosistema SIPBA.

### Justificación
*   **Control y Visibilidad:** Permite a Osiptel fungir como el "Garante", recuperando el control total sobre los procesos de validación.
*   **Seguridad Unificada:** Facilita la implementación de estándares de seguridad (mTLS, OAuth2) de forma homogénea.
*   **Gobernanza de Reglas:** Permite aplicar la regla de penalización a distribuidores de forma transversal, sin depender de los logs internos de las operadoras.
*   **Auditoría:** Genera una pista de auditoría única e inalterable para todos los eventos de activación y bloqueo.

### Consecuencias
*   **Punto Único de Falla:** Requiere una arquitectura de alta disponibilidad (99.99%) para evitar la paralización del mercado móvil.
*   **Responsabilidad de Latencia:** Osiptel es ahora responsable de que los tiempos de validación no afecten la experiencia de venta.
