# Capacidad de Arquitectura (Architecture Capability)

Define la estructura organizativa, roles y responsabilidades críticos para la gobernanza y mantenimiento del Repositorio de Arquitectura SIPBA.

## 1. Roles Críticos e Intereses

| Rol | Responsabilidad Clave | Impacto en SIPBA |
| :--- | :--- | :--- |
| **Arquitecto de Integración y APIs** | Gobernar el API Gateway y el flujo transaccional. | Asegura la interoperabilidad sin cuellos de botella entre Osiptel, RENIEC y Operadoras. |
| **Oficial de Privacidad y Custodia** | Vigilancia de la Ley de Protección de Datos Personales. | Garantiza que los vectores biométricos se manejen como datos sensibles (LPDP). |
| **Especialista en Ciberseguridad (IAM)** | Gestión de identidades, certificados (mTLS) y tokens. | Protege los puntos de acceso de sistemas externos y asegura el no repudio. |
| **Analista de Cumplimiento (SLA Monitor)** | Monitoreo de reglas y penalizaciones automáticas. | Ejecuta automáticamente el bloqueo de distribuidores y garantiza los tiempos de respuesta. |

## 2. Procesos de Gestión
*   **Mantenimiento del Repositorio:** El Architecture Board revisará trimestralmente la vigencia de los estándares en el SIB.
*   **Gestión de Excepciones:** Cualquier desviación de los estándares de integración debe ser documentada como una solicitud de excepción en el Registro de Gobernanza.
