# Paisaje de Arquitectura (Architecture Landscape)

El Paisaje de Arquitectura proporciona una visión multinivel de los activos y capacidades tecnológicas que componen el ecosistema SIPBA.

## 1. Arquitectura Estratégica: Osiptel como Hub Transaccional
A nivel estratégico, Osiptel deja de ser un receptor pasivo de información para convertirse en el **Garante del Ecosistema Digital**.
*   **Modelo de Operación:** Arquitectura Orientada a Eventos (EDA).
*   **Rol Central:** Bus de Integración Seguro que orquesta la identidad entre el sector público (RENIEC, PNP) y el privado (Operadoras).

## 2. Arquitectura de Segmento: Flujo de Colaboración Interinstitucional
Describe la interacción específica entre los actores clave para la erradicación del fraude:

1.  **Denuncia (PNP -> SIPBA):** La PNP reporta un número extorsivo mediante un endpoint seguro.
2.  **Validación (SIPBA -> RENTESEG):** El SIPBA cruza el número denunciado con la titularidad real en tiempo real.
3.  **Acción (SIPBA -> Operadora):** El SIPBA emite una instrucción de bloqueo inmediato con prioridad alta hacia la operadora correspondiente.

## 3. Arquitectura de Capacidad: Servicios Especializados
Servicios técnicos granulares requeridos para el funcionamiento del SIPBA:
*   **Detección de Vitalidad (Liveness Detection):** Capacidad de procesar vectores biométricos en el Edge para confirmar "prueba de vida".
*   **Orquestación de Bloqueo:** Motor de reglas que traduce una denuncia legal en una acción técnica de red.
*   **Gestión de Identidad B2B:** Uso de mTLS y OAuth 2.0 para asegurar que solo servidores autorizados participen en el intercambio.
