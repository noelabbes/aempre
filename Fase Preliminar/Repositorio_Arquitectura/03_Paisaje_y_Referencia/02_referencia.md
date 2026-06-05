# Biblioteca de Referencia (Reference Library)

Este documento consolida las guías, marcos legales y patrones técnicos que sirven como base para el diseño y construcción de la arquitectura SIPBA.

## 1. Marco Legal y Normativo
*   **Decreto Legislativo N° 1738:** Marco legal que faculta a Osiptel para la gestión del RENTESEG y la implementación de medidas preventivas contra la extorsión.
*   **Ley de Protección de Datos Personales (LPDP):** Guía obligatoria para el manejo de vectores biométricos y privacidad por diseño.

## 2. Patrones de Diseño Arquitectónico
*   **Patrón de Fachada (Facade):** Implementado en el API Gateway para desacoplar el perímetro de la lógica core.
*   **Event-Driven Architecture (EDA):** Patrón de referencia para garantizar la asincronía y escalabilidad en el envío de bloqueos masivos.
*   **Zero Trust Architecture:** Principio de "nunca confiar, siempre verificar" aplicado a todas las integraciones B2B mediante mTLS.

## 3. Estándares Internacionales de Identidad
*   **NIST SP 800-63 (Digital Identity Guidelines):** Referencia para los niveles de aseguramiento de identidad (IAL) y autenticación (AAL).
*   **Protocolos de Verificación Biométrica:** Estándares para el intercambio seguro de minucias y hashes biométricos.
