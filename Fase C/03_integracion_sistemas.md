# Interfaces e Integración de Sistemas (Fase C)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable define las **Interfaces de Integración y Contratos de APIs** para el ecosistema SIPBA. Se especifican los endpoints, métodos HTTP, esquemas de seguridad, y las estructuras JSON detalladas (payloads) de entrada y salida para cada transacción crítica.

---

## 1. Lineamientos Generales de Integración

*   **Formato de Intercambio:** Todos los datos se envían en formato `application/json` codificados en `UTF-8`.
*   **Protocolo de Capa de Red y Transporte:** HTTPS obligatorio con **TLS 1.3** y **mTLS** (autenticación mutua).
*   **Esquema de Autorización:** OAuth 2.0 (Bearer Token JWT) para autenticar las llamadas de las operadoras y la PNP.
*   **No Repudio (Firma Digital):** Para asegurar la autenticidad, cada payload transaccional enviado por la operadora o la PNP debe ir acompañado de una cabecera `X-Signature` que contenga una firma criptográfica (SHA256withRSA) generada con la llave privada del emisor, validada en el API Gateway contra su certificado público.

---

## 2. Catálogo de APIs de SIPBA

### 2.1. API de Activación de Línea (B2B - Síncrono)
Consumido de manera obligatoria por los CRM y sistemas comerciales de las operadoras de telefonía móvil antes de proceder con el aprovisionamiento de la SIM en la red.

*   **Endpoint:** `POST https://sipba.osiptel.gob.pe/api/v1/activaciones`
*   **Cabeceras Requeridas:**
    ```http
    Content-Type: application/json
    Authorization: Bearer <access_token>
    X-Signature: <firma_digital_rsa_del_payload>
    X-Operadora-Id: CLARO_PE
    ```

#### Payload de Solicitud (Request Body)
```json
{
  "dni_titular": "71829384",
  "nombres_completos": "Juan Perez Gomez",
  "msisdn": "998877665",
  "imei_dispositivo": "358941091234567",
  "token_distribuidor": "9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb6d",
  "captura_biometrica": {
    "formato": "jpeg",
    "imagen_b64": "/9j/4AAQSkZJRgABAQEASABIAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQU...[TRUNCATED]",
    "liveness_verified": true
  },
  "timestamp_captura": "2026-06-19T23:54:10Z"
}
```

#### Payload de Respuesta - Activación Aprobada (Response Body - 200 OK)
```json
{
  "id_transaccion": "a5c9e2b1-12c4-4b47-ba21-9e7f8d62acba",
  "estado": "APROBADA",
  "motivo": "Verificación biométrica y reglas de negocio conformes.",
  "cotejo_reniec": {
    "ticket_cotejo": "REN-2026-9876543-X",
    "score_similitud": 94.5,
    "mensaje": "Coincidencia biométrica exitosa."
  },
  "reglas_core": {
    "lineas_activas_titular": 3,
    "limite_excedido": false,
    "imei_estado_renteseg": "LISTA_BLANCA"
  },
  "timestamp_respuesta": "2026-06-19T23:54:11Z",
  "firma_osiptel": "MIIEvgYJKoZIhvcNAQcCoIIErTCCBKkCAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEH..."
}
```

#### Payload de Respuesta - Denegada por Biometría (Response Body - 403 Forbidden)
```json
{
  "id_transaccion": "f47ac10b-58cc-4372-a567-0e02b2c3d479",
  "estado": "DENEGADA_BIOMETRIA",
  "motivo": "Fallo en la validación de identidad biométrica.",
  "cotejo_reniec": {
    "ticket_cotejo": "REN-2026-9876599-E",
    "score_similitud": 41.2,
    "mensaje": "La imagen proporcionada no coincide con el registro del ciudadano."
  },
  "reglas_core": {
    "lineas_activas_titular": 3,
    "limite_excedido": false,
    "imei_estado_renteseg": "LISTA_BLANCA"
  },
  "timestamp_respuesta": "2026-06-19T23:54:11Z"
}
```

#### Payload de Respuesta - Denegada por Reglas Core (Response Body - 403 Forbidden)
```json
{
  "id_transaccion": "d1a8e9f2-2b3c-4d5e-8f9a-0b1c2d3e4f5a",
  "estado": "RECHAZADA_EXCESOLINEAS",
  "motivo": "El ciudadano excede el límite máximo permitido de 7 líneas móviles activas a nivel nacional.",
  "cotejo_reniec": {
    "ticket_cotejo": "REN-2026-9876602-L",
    "score_similitud": 91.8,
    "mensaje": "Coincidencia biométrica exitosa."
  },
  "reglas_core": {
    "lineas_activas_titular": 7,
    "limite_excedido": true,
    "imei_estado_renteseg": "LISTA_BLANCA"
  },
  "timestamp_respuesta": "2026-06-19T23:54:12Z"
}
```

---

### 2.2. API de Bloqueo Inmediato por PNP (B2B - Asíncrono)
Consumido de forma automática por el sistema de denuncias de la PNP (DIVINDAT) al registrarse un caso de robo, extorsión o SIM Swapping.

*   **Endpoint:** `POST https://sipba.osiptel.gob.pe/api/v1/bloqueos`
*   **Cabeceras Requeridas:**
    ```http
    Content-Type: application/json
    Authorization: Bearer <access_token_pnp>
    X-Signature: <firma_digital_pnp>
    ```

#### Payload de Solicitud (Request Body)
```json
{
  "imei_equipo": "358941091234567",
  "msisdn_asociado": "998877665",
  "denunciante_dni": "08192837",
  "sustento_legal": "DEN-PNP-2026-8877-A",
  "motivo_bloqueo": "ROBO_EXTORSION",
  "detalles_incidente": "Equipo móvil sustraído con arma de fuego en vía pública.",
  "timestamp_denuncia": "2026-06-19T23:45:00Z"
}
```

#### Payload de Respuesta - Solicitud Aceptada (Response Body - 202 Accepted)
```json
{
  "id_solicitud": "7b8a2c3d-9e12-4c34-ba56-8d7e9f01ab23",
  "estado_solicitud": "PENDIENTE_EJECUCION",
  "mensaje": "Solicitud recibida correctamente y encolada para su propagación asíncrona hacia las redes móviles.",
  "timestamp_recepcion": "2026-06-19T23:54:15Z"
}
```

---

### 2.3. Webhook de Notificación de Suspensión (Emitido por SIPBA - Asíncrono)
Consumido por las operadoras móviles para recibir órdenes automáticas de bloqueo/suspensión dictadas por SIPBA (ej. tras denuncia PNP o inconsistencia en la reconciliación ETL diaria).

*   **Endpoint:** `POST https://api-sistema.operadora.com.pe/webhooks/suspensiones-sipba`
*   **Cabeceras Requeridas (Enviadas por SIPBA):**
    ```http
    Content-Type: application/json
    Authorization: Bearer <access_token_sipba_para_operadora>
    X-Signature: <firma_digital_osiptel>
    ```

#### Payload del Evento (Request Body - Enviado por SIPBA)
```json
{
  "id_evento": "e8c2a3b4-7d9e-1a2b-3c4d-5e6f7a8b9c0d",
  "id_solicitud_bloqueo": "7b8a2c3d-9e12-4c34-ba56-8d7e9f01ab23",
  "imei_bloquear": "358941091234567",
  "msisdn_suspender": "998877665",
  "motivo": "INSTRUCCION_PNP_ROBO",
  "sustento": "DEN-PNP-2026-8877-A",
  "timestamp_emision": "2026-06-19T23:54:17Z"
}
```

#### Payload de Confirmación de la Operadora (Response Body - 200 OK)
```json
{
  "id_evento_recibido": "e8c2a3b4-7d9e-1a2b-3c4d-5e6f7a8b9c0d",
  "estado_procesamiento": "EJECUTADO",
  "detalles": "Línea suspendida en HLR y terminal bloqueado en EIR de manera exitosa.",
  "timestamp_ejecucion": "2026-06-19T23:54:19Z"
}
```

---

### 2.4. API de Consulta Ciudadana de Líneas (Pública - GET)
API consumida por el Portal de Autoservicio de OSIPTEL para que los ciudadanos verifiquen qué líneas están activas a su nombre. Este endpoint se integra bajo la ruta pública `/api/v1/hex/**` con protección de rate limiting y validación captcha previa del cliente frontend.

*   **Endpoint:** `GET https://sipba.osiptel.gob.pe/api/v1/hex/consultas/lineas/{dni}`
*   **Cabeceras Requeridas:**
    ```http
    Accept: application/json
    X-Client-Channel: PORTAL_WEB
    ```

#### Payload de Respuesta (Response Body - 200 OK)
```json
{
  "dni_consultado": "71829384",
  "total_lineas_activas": 2,
  "lineas": [
    {
      "msisdn": "998877665",
      "operadora": "CLARO",
      "fecha_alta": "2024-03-15",
      "estado": "ACTIVA"
    },
    {
      "msisdn": "922334455",
      "operadora": "MOVISTAR",
      "fecha_alta": "2025-08-01",
      "estado": "ACTIVA"
    }
  ],
  "timestamp_consulta": "2026-06-19T23:54:30Z"
}
```

#### Payload de Respuesta - Sin Líneas Registradas (Response Body - 200 OK)
```json
{
  "dni_consultado": "09876543",
  "total_lineas_activas": 0,
  "lineas": [],
  "timestamp_consulta": "2026-06-19T23:54:32Z"
}
```

---

## 3. Códigos de Error Comunes

Toda respuesta de error sigue el estándar de formato RFC 7807 (`Problem Details for HTTP APIs`).

```json
{
  "type": "https://sipba.osiptel.gob.pe/errors/invalid-token-distribuidor",
  "title": "Distribuidor Invalido o Suspendido",
  "status": 400,
  "detail": "El token de distribuidor provisto está registrado en estado 'SANCIONADO' debido a múltiples reincidencias de fraude.",
  "instance": "/api/v1/activaciones",
  "code": "SIPBA-ERR-304",
  "timestamp": "2026-06-19T23:54:35Z"
}
```

| Código de Error | Estado HTTP | Título | Descripción |
| :--- | :--- | :--- | :--- |
| **SIPBA-ERR-101** | 401 | Unauthorized | El token de autenticación mTLS o OAuth 2.0 es inválido o ha expirado. |
| **SIPBA-ERR-102** | 400 | Invalid Signature | La cabecera `X-Signature` no corresponde con el hash cifrado del payload. |
| **SIPBA-ERR-201** | 429 | Too Many Requests | Se ha superado la tasa límite asignada para este canal/operador. |
| **SIPBA-ERR-301** | 400 | Invalid DNI | El número de DNI ingresado no es válido o no existe en los padrones de RENIEC. |
| **SIPBA-ERR-302** | 400 | Blocked IMEI | El IMEI ingresado posee un reporte activo de robo en el RENTESEG. |
| **SIPBA-ERR-304** | 400 | Terminated Channel | El distribuidor que reporta la venta no está autorizado para realizar activaciones. |
| **SIPBA-ERR-503** | 503 | Integration Timeout | El servicio de RENIEC o RENTESEG no responde en el tiempo límite seguro. |

---
*Nota: Todos los contratos aquí definidos han sido estructurados para operar de forma desacoplada bajo la arquitectura orientada a eventos descrita en el entregable ([02_arquitectura_aplicaciones.md](file:///D:/aempre/Fase%20C/02_arquitectura_aplicaciones.md)).*
