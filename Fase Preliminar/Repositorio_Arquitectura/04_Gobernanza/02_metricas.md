# Cumplimiento y Métricas (Compliance & Performance)

Define los indicadores clave de rendimiento (KPIs) y los mecanismos de cumplimiento que aseguran la efectividad operativa de la arquitectura SIPBA.

## 1. Métricas de Rendimiento (Performance KPIs)

| KPI | Objetivo (SLA) | Descripción |
| :--- | :--- | :--- |
| **Latencia de Validación** | < 3 segundos | Tiempo total desde la captura del vector hasta la respuesta de RENIEC. |
| **Tiempo de Bloqueo** | < 1 hora | Tiempo máximo desde la recepción de la denuncia PNP hasta el bloqueo efectivo. |
| **Disponibilidad (Uptime)** | 99.99% | El Hub Transaccional debe estar operativo 24/7 sin interrupciones críticas. |
| **Throughput (Capacidad)** | 500 TPS | Capacidad de procesar transacciones por segundo en horas pico de ventas. |

## 2. Métricas de Calidad Biométrica
*   **FAR (False Acceptance Rate):** Menor al 0.1% para evitar suplantaciones exitosas.
*   **FRR (False Rejection Rate):** Menor al 1% para no afectar a usuarios legítimos por fallas del sensor.
*   **Liveness Confidence:** Umbral mínimo de 95% de confianza en las pruebas de vida.

## 3. Evaluación de Cumplimiento (Compliance)
*   **Auditoría de Penalizaciones:** Verificación mensual de que el sistema revocó automáticamente el acceso a distribuidores con 3 incidentes.
*   **Conformidad mTLS:** Escaneo semanal para asegurar que el 100% de los endpoints externos utilizan certificados vigentes y autorizados.
*   **Gap Assessment:** Evaluación semestral del nivel de madurez tecnológica de las operadoras para soportar nuevas versiones de los algoritmos de liveness.
