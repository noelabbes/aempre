# Metamodelo de Arquitectura (Architecture Metamodel)

Establece el lenguaje común y las relaciones estructurales entre los conceptos de negocio, datos, aplicación y tecnología del ecosistema SIPBA.

## 1. Entidades Clave por Capa

### Capa de Negocio
*   **Regla de Negocio:** Directivas como "Tolerancia Cero" o "Límite de 7 líneas".
*   **Actor Externo:** Operadoras, RENIEC, PNP, Ciudadano.

### Capa de Datos
*   **Entidad de Validación:** Contiene el `Token_de_Verificacion`, `Score_de_Similitud_Biometrica` y `Timestamp`.
*   **Vector Biométrico:** Hash generado en el borde (Edge) que contiene minucias y metadatos de vida (Liveness).
*   **Activo RENTESEG:** Identificadores únicos como el `IMEI` del dispositivo, `Clave_Temporal_Activacion`, `DNI`, `Nombres_y_Apellidos`.

### Capa de Aplicación
*   **Servicio de Fachada (API Gateway):** Punto de entrada para validación de esquemas y rate limiting.
*   **Servicio Core:** Microservicios internos para evaluación de reglas y orquestación de bloqueos.

### Capa de Tecnología
*   **Evento de Bloqueo:** Instrucción técnica ejecutada vía Webhook o Bus de Mensajes (Kafka/RabbitMQ).

## 2. Relaciones Estructurales
1.  **Gobernanza:** Una *Regla de Negocio* gobierna la ejecución de un *Servicio Core*.
2.  **Disparo (Trigger):** La violación de una *Regla de Negocio* desencadena un *Evento de Bloqueo*.
3.  **Realización:** El *Servicio Core* realiza la validación contra la *Entidad de Validación* enviada por el *API Gateway*.

## 3. Entidades Compartidas (SIPBA-RENIEC)
Osiptel no almacena datos biométricos crudos. El intercambio se limita a:
*   `DNI_Titular`
*   `Token_de_Verificacion` (Emitido por RENIEC)
*   `Score_de_Similitud_Biometrica`
*   `Hash_Biometrico_Temporal` (Para la sesión de validación)
