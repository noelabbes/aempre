# Visión de Arquitectura (Architecture Vision)

Este documento describe la transformación estratégica de Osiptel desde el estado actual (vulnerable) hacia un ecosistema de identidad móvil seguro y resiliente.

## 1. Escenario Actual (AS-IS)
La arquitectura actual presenta debilidades críticas que facilitan el fraude por SIM Swapping y la extorsión:

*   **Puntos de Falla en Bloqueo (24h):**
    *   **Asincronía Humana:** La recepción de denuncias depende de procesos manuales (call centers), retrasando el ingreso al sistema.
    *   **Procesamiento por Lotes (Batch):** Las operadoras ejecutan bloqueos en ventanas de tiempo diferidas, no de forma inmediata.
    *   **Silos de Información:** Falta de sincronización en tiempo real entre RENTESEG y los sistemas de las operadoras.
*   **Vulnerabilidad en Activación:** Falta de biometría obligatoria y rigurosa en canales de venta ambulatorios.

## 2. Escenario Objetivo (TO-BE)
El Proyecto SIPBA transforma a Osiptel en un **Hub Transaccional en Tiempo Real**:

*   **Bloqueo Inmediato (< 1h):** Integración directa con el sistema de denuncias de la PNP y ejecución de eventos de bloqueo automáticos hacia las operadoras.
*   **Ecosistema Seguro:** Validación biométrica facial con prueba de vida (Liveness Detection) obligatoria para el 100% de las activaciones críticas.
*   **Garante de Identidad:** Osiptel centraliza la validación ante RENIEC, eliminando la dependencia de validaciones locales en las operadoras.

## 3. Análisis de Brechas (Gap Analysis)
*   **Tecnología:** Transición de sistemas batch a Arquitectura Orientada a Eventos (EDA).
*   **Gobernanza:** Implementación de reglas de negocio automáticas (ej. límite de 7 líneas) controladas por el regulador.
*   **Capacidad:** Cierre de la brecha digital en operadoras pequeñas para soportar biometría de alta fidelidad.
