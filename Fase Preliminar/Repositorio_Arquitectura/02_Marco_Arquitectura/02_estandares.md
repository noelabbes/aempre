# Base de Información de Estándares (Standards Information Base - SIB)

El SIB cataloga los estándares y políticas obligatorias que garantizan la integridad y seguridad del ecosistema SIPBA.

## 1. Estándares de Negocio (Business Standards)

### 1.1. Regla de Tolerancia Cero
*   **Descripción:** No se permiten excepciones manuales en el proceso de activación.
*   **Condición:** Toda activación debe superar el umbral de *Liveness Detection*. De lo contrario, es rechazada y auditada automáticamente.

### 1.2. Penalización a Distribuidores
*   **Métrica:** Contador de incidentes de fraude vinculados al código de distribuidor.
*   **Acción:** Al 3er incidente en 12 meses, se revoca automáticamente el token de acceso a las APIs de activación.

## 2. Estándares de Datos (Data Standards)

### 2.1. Payload del Vector Biométrico
Para garantizar seguridad y eficiencia, el intercambio de datos sigue este esquema:
*   `Hash_Biometrico`: Minucias extraídas en el borde (no imagen cruda).
*   `Metadatos_Liveness`: Confirmación técnica de prueba de vida.
*   `ID_Dispositivo_Captura`: Trazabilidad del hardware utilizado.
*   `Geolocalización`: Coordenadas de la transacción.

## 3. Estándares de Aplicación (Application Standards)

### 3.1. Patrón de Fachada (API Gateway)
*   **Perímetro:** El API Gateway gestiona Autenticación, Rate Limiting y Validación de Esquemas.
*   **Aislamiento Core:** Los microservicios de reglas de negocio residen en una zona segura (Internal VNET) sin exposición directa a Internet.

## 4. Estándares de Tecnología (Technical Standards)

### 4.1. Protocolos de Comunicación
*   **Síncrono:** RESTful APIs con JSON para validaciones críticas (RENIEC).
*   **Asíncrono:** Bus de mensajes (Kafka/RabbitMQ) para la propagación de eventos de bloqueo masivo.

### 4.2. Seguridad de Integración
*   **mTLS (Mutual TLS):** Obligatorio para la comunicación entre servidores institucionales.
*   **OAuth 2.0:** Flujo de *Client Credentials* para autorización B2B.
*   **Firmas JWT:** Garantizan el no repudio de las instrucciones de bloqueo.
