# Contrato de Arquitectura del Proyecto (Fase G)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este documento constituye el **Contrato de Arquitectura** formal que rige la relación entre la Autoridad de Arquitectura de OSIPTEL (liderada por la GTIC y la GFS) y las entidades encargadas del desarrollo, provisión de software y conectividad de red (Operadoras Móviles y Proveedores de Integración de Software).

---

## 1. Declaración de Intenciones y Objetivos del Contrato

El propósito de este contrato es garantizar que la implementación física del sistema SIPBA se mantenga 100% fiel a los planos de arquitectura definidos en las fases anteriores (C y D) del ADM de TOGAF. 

### Objetivos Principales:
1.  Asegurar la interoperabilidad síncrona y asíncrona entre las operadoras, OSIPTEL, RENIEC y la PNP.
2.  Mantener niveles estrictos de seguridad, protección de datos personales (LPDP) y rendimiento transaccional en tiempo real.
3.  Evitar desviaciones en el diseño de software que comprometan la resiliencia nacional ante incidentes de ciberseguridad o desastres naturales.

---

## 2. Requisitos de Calidad de Sistemas y Métricas de Conformidad

Los firmantes de este contrato se comprometen a diseñar, construir y desplegar el software cumpliendo con las siguientes métricas de rendimiento y SLAs productivos:

### 2.1. Métricas de Rendimiento Transaccional (Performance)

| Id | Componente / Operación | Métrica Target (SLA) | Punto de Medición |
| :--- | :--- | :--- | :--- |
| **M-1** | Latencia Transaccional del Core | RTT $< 50$ ms (p95) | Tiempo de ejecución de reglas dentro del `SIPBA-CORE`. |
| **M-2** | Latencia de Activación Extremo a Extremo | RTT $< 2.0$ segundos (p95) | Desde que ingresa a `SIPBA-GW` hasta la respuesta (excluye lentitud de red externa). |
| **M-3** | Tiempo de Procesamiento Asíncrono | RTT $< 15$ minutos (p95) | Desde que se publica el bloqueo en Kafka hasta la desconexión del IMEI en HLR/EIR. |
| **M-4** | Concurrencia Soportada | Mínimo 200 TPS (peticiones/seg) | Capacidad mínima de carga sin degradación del API Gateway. |

### 2.2. Métricas de Disponibilidad y Resiliencia (Availability)
*   **Disponibilidad de las APIs de SIPBA:** $99.99\%$ de tiempo de actividad anual (Uptime), equivalente a menos de 52 minutos de inactividad acumulada al año.
*   **RTO (Recovery Time Objective):** $< 15$ minutos ante caídas de la región principal de nube pública.
*   **RPO (Recovery Point Objective):** $< 1$ minuto de pérdida transaccional en base de datos.

### 2.3. Métricas de Seguridad y Privacidad (Security)
*   **Cifrado obligatorio:** TLS 1.3 con mTLS y firmas RSA digitales para todas las llamadas B2B de Activación y Bloqueo.
*   **LPDP Compliance:** Ningún log, base de datos temporal o disco debe persistir imágenes de rostros o minucias biométricas enviadas por los terminales de venta.

---

## 3. Consecuencias del Incumplimiento y Mecanismos de Sanción

El regulador de telecomunicaciones (OSIPTEL) aplicará penalizaciones administrativas e inhabilitaciones inmediatas ante desviaciones de la arquitectura de la solución:

1.  **Suspensión del Canal de Ventas (Strike 3):**
    *   Si el sistema ETL nocturno de OSIPTEL detecta que un distribuidor de una operadora ha registrado activaciones con bypass biométrico o reincidencias de suplantación, su token OAuth de acceso se inhabilitará en Redis de forma automática.
2.  **Multas por Incumplimiento de SLA de Bloqueo:**
    *   Si una operadora móvil tarda más de 30 minutos en aplicar un bloqueo de IMEI o línea desde que el evento fue depositado en su cola Kafka (sin causa técnica atribuible a OSIPTEL), se iniciará un expediente sancionador automático por infracción muy grave (Ley de RENTESEG), aplicando multas calculadas por cada minuto de retardo.
3.  **Revocación de Certificados Digitales:**
    *   Cualquier operadora que exponga claves criptográficas públicas o cuyas APIs no cumplan con el firmado de cabecera `X-Signature` verá revocado su certificado mTLS del API Gateway, aislándola del Hub SIPBA hasta la auditoría de subsanación.

---

## 4. Firmas de Conformidad

Este contrato se firma de mutuo acuerdo y entra en vigencia a partir del hito de aprobación del Comité de Gobernanza de OSIPTEL, vinculando a los equipos técnicos y gerenciales de las partes involucradas.

```
       [ Firma Digital ]                             [ Firma Digital ]
    -----------------------                       -----------------------
       Gerente de GTIC                               Gerente de GFS
       OSIPTEL (Regulador)                           OSIPTEL (Fiscalizador)


       [ Firma Digital ]                             [ Firma Digital ]
    -----------------------                       -----------------------
       Director de Redes                             Gerente de TI
       Operadora de Telefonía                        Proveedor de Software
