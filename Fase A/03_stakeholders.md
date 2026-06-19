# Mapa y Análisis de Stakeholders (Fase A: Visión)

El análisis de stakeholders permite identificar a los actores clave, sus preocupaciones y el nivel de compromiso necesario para el éxito del proyecto SIPBA.

## 1. Matriz de Interesados (Poder vs. Interés)

| Interesado | Influencia (Poder) | Interés | Estrategia de Gestión |
| :--- | :---: | :---: | :--- |
| **Alta Dirección Osiptel** | Alto | Alto | **Gestionar de cerca:** Mantener patrocinio y presupuesto. |
| **RENIEC (GTI)** | Alto | Alto | **Gestionar de cerca:** Asegurar escalabilidad y seguridad. |
| **PNP (DIVINDAT)** | Medio | Alto | **Mantener informados:** Asegurar adopción operativa en comisarías. |
| **Operadoras (AFIN)** | Alto | Medio | **Mantener satisfechos:** Reducir fricción comercial y multas. |
| **Ciudadanía** | Bajo | Alto | **Mantener informados:** Sensibilizar sobre seguridad financiera. |

## 2. Niveles de Compromiso (Actual vs. Deseado)

| Actor | Estado Actual | Estado Deseado | Acción Requerida |
| :--- | :---: | :---: | :--- |
| **Dirección Osiptel** | Lidera | Lidera | Mantener alineación con metas país. |
| **Asociación Operadoras** | Resistente | Apoya | Demostrar ahorro por reducción de fraudes. |
| **PNP Operativa** | Neutral | Apoya | Capacitación técnica y mejora de conectividad. |
| **RENIEC Técnica** | Apoya | Lidera | Mesas técnicas para asegurar SLAs < 3s. |
| **Consumidores** | Inconsciente | Apoya | Campaña de comunicación: "Seguridad vs Fricción". |

## 3. Preocupaciones y Vistas de Arquitectura
Cada stakeholder requiere una perspectiva específica de la arquitectura para validar sus intereses:

*   **RENIEC (GTI):**
    *   *Preocupación:* Capacidad transaccional y SPOF.
    *   *Vista Requerida:* **Vista de Infraestructura y Despliegue** y **Vista de Seguridad (mTLS/JWT)**.
*   **PNP (DIVINDAT):**
    *   *Preocupación:* Automatización de denuncias y evidencia legal.
    *   *Vista Requerida:* **Vista de Procesos de Negocio (BPMN)** y **Vista de Interoperabilidad**.
*   **Operadoras (Claro, Movistar, Entel, Bitel):**
    *   *Preocupación:* Costo de refactorización y latencia de venta.
    *   *Vista Requerida:* **Vista de Secuencia (Telemetría)** y **Vista de Componentes**.
*   **Alta Dirección (Osiptel):**
    *   *Preocupación:* Cumplimiento de metas políticas y reducción del crimen.
    *   *Vista Requerida:* **Vista de Motivación (BMM)** y Tableros de Control de KPIs.

## 4. Estrategia de Comunicación
*   **Mesas Técnicas Mensuales:** Con RENIEC y Operadoras para ajuste de SLAs.
*   **Talleres Operativos:** Con la PNP para integración de denuncias virtuales.
*   **Reportes de Estatus Ejecutivos:** Para el Architecture Board de Osiptel.
