# Solicitud de Requisitos para el Repositorio de Arquitectura SIPBA

**Para:** Agente de Diseño de Arquitectura
**Asunto:** Información requerida para completar el Repositorio de Arquitectura (TOGAF aligned).

Estimado agente, para formalizar el Repositorio de Arquitectura del proyecto SIPBA, requerimos los siguientes detalles específicos basados en el trabajo ya desarrollado:

### 0. Capacidad y Metamodelo (Secciones 1 - 2)
*   **Capacidad de Arquitectura:** ¿Qué roles (ej. Arquitecto de Seguridad, Analista de Datos RENTESEG) se han identificado como críticos para la gobernanza del repositorio?
*   **Metamodelo:** Definir las relaciones clave. Por ejemplo: ¿Cómo se vincula un "Evento de Bloqueo" (Tecnología) con una "Regla de Negocio" (Negocio)? ¿Qué entidades de datos son compartidas entre el SIPBA y el RENIEC?

### 1. Marco de Arquitectura (Sección 3.1 - 3.2)
*   **Visión AS-IS detallada:** ¿Cuáles son los puntos exactos de falla en el proceso de bloqueo de 24 horas actual?
*   **Estándares de Negocio:** Detallar la regla de "tolerancia cero" y el proceso de penalización a distribuidores (los "3 incidentes").
*   **Estándares de Datos:** ¿Qué campos específicos componen el vector biométrico que se enviará al RENIEC?
*   **Estándares de Aplicación:** Definir la lógica de "separación estricta" entre el core y las interfaces externas del API Gateway.

### 2. Paisaje de Arquitectura (Sección 2.3 - 2.4)
*   **Arquitecturas Estratégicas:** ¿Cómo se define técnicamente el rol de Osiptel como "Hub Transaccional"? (Protocolos, tipos de mensajes).
*   **Arquitecturas de Segmento:** Detallar el flujo de comunicación SIPBA -> RENTESEG -> PNP para denuncias.
*   **Patrones de Integración:** ¿Qué patrones de seguridad (OAuth2, mTLS, etc.) se han definido para las APIs expuestas?

### 3. Registro de Gobernanza (Sección 3)
*   **Decisiones Clave:** ¿Por qué se optó por un API Gateway centralizado en lugar de una federación de servicios?
*   **Métricas (KPIs):** Además del SLA < 1 hora, ¿qué otras métricas de rendimiento (throughput, latencia máxima) debe cumplir el sistema?
*   **Evaluación de Capacidad:** ¿Cuál es el "Gap" principal identificado en las operadoras pequeñas para soportar biometría facial?

---
*Favor de responder en formato Markdown manteniendo esta estructura para facilitar la integración en el repositorio.*
