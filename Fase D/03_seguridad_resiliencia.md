# Seguridad Física y Resiliencia (Fase D)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable define las políticas, mecanismos tecnológicos y configuraciones físicas para garantizar la **Seguridad Criptográfica, la Resiliencia Operativa** y la **Observabilidad** del sistema SIPBA ante cualquier escenario de desastre, ataques cibernéticos o indisponibilidad de proveedores.

---

## 1. Integración con HSM (Hardware Security Module)

Para garantizar la inalterabilidad de los registros, el no repudio de las operaciones y el cifrado seguro de datos personales, SIPBA se integra con módulos HSM con certificación de seguridad **FIPS 140-3 Nivel 3**:

```
+--------------------------------------------------------------------------+
| VPC SIPBA (NUBE PÚBLICA)                                                 |
|                                                                          |
|  [SIPBA-GW / API Gateway]                                                |
|       |                                                                  |
|       |-- Conexión Segura (mTLS / Canal Cifrado Dedicado)                |
|       v                                                                  |
|  [AWS CloudHSM Cluster (Clon Criptográfico)]                             |
|       |                                                                  |
|       |-- Sincronización de Llaves Criptográficas (mTLS)                 |
|       v                                                                  |
+-------+------------------------------------------------------------------+
        |
        v Enlace Dedicado (Direct Connect)
+-------+------------------------------------------------------------------+
| DATACENTER FÍSICO OSIPTEL (ON-PREMISES)                                  |
|                                                                          |
|  [HSM Físico Core (Dispositivo de Seguridad en Rack)]                     |
|  - Almacena Llave Privada de Firma Digital de OSIPTEL (Firma de Tickets)  |
|  - Generación de Llaves de Cifrado AES-256 de base de datos              |
+--------------------------------------------------------------------------+
```

### 1.1. Operación de Firmas Digitales de No Repudio
*   **Firma de Respuestas:** Cuando `SIPBA-GW` emite un estado de aprobación (`APROBADA`) o denegación, el hash de la transacción se envía al clúster de HSM para ser firmado digitalmente. La llave privada de firma de OSIPTEL **nunca sale de la memoria física del HSM**, impidiendo cualquier robo o duplicación del certificado.
*   **Verificación:** La firma generada se adjunta en la cabecera HTTP de respuesta (`X-Signature`), permitiendo a las operadoras verificar con la llave pública de OSIPTEL que el ticket fue efectivamente emitido por el regulador.

### 1.2. Gestión de Llaves de Cifrado (KMS / HSM)
*   **Cifrado a Nivel de Columna:** Los datos sensibles del ciudadano (DNI, nombres) y hashes de cotejo en la base de datos se cifran con el algoritmo **AES-256-GCM**.
*   **Rotación de Llaves:** Las llaves simétricas se generan dentro del HSM y se rotan automáticamente cada 90 días sin afectar la disponibilidad del servicio.

---

## 2. Alta Disponibilidad (HA) y Recuperación ante Desastres (DRP)

El sistema SIPBA se clasifica como infraestructura crítica nacional de telecomunicaciones. Se diseñan arquitecturas de tolerancia a fallas y redundancia regional.

### 2.1. Métricas de Resiliencia Target

*   **RTO (Recovery Time Objective):** $< 15$ minutos. Tiempo máximo tolerable para restablecer el servicio SIPBA tras un fallo catastrófico en la infraestructura de nube.
*   **RPO (Recovery Point Objective):** $< 1$ minuto. Pérdida máxima tolerable de datos de transacciones en caso de caída total (garantizado por la replicación continua).

### 2.2. Estrategia de Disaster Recovery (DR) Multi-Región

Para mitigar la caída de una región completa del proveedor de nube (ej. colapso de la región `us-east-1`), se adopta una arquitectura de recuperación tipo **Warm Standby** en una segunda región geográfica (`us-east-2` - Ohio):

```
+------------------------------------+       +------------------------------------+
| REGIÓN PRINCIPAL (Virginia - Activa)|       | REGIÓN DE RESPALDO (Ohio - Standby)|
|                                    |       |                                    |
| [Clúster EKS Transaccional (100%)] |       | [Clúster EKS Transaccional (10%)]  |
|                 |                  |       |                 |                  |
|                 v                  |       |                 v                  |
| [PostgreSQL Aurora (Primaria)]     |       | [PostgreSQL Aurora (Réplica)]      |
|                 |                  |       |                 ^                  |
|                 +-- Replicación de Almacenamiento Global ----+                  |
+------------------------------------+       +------------------------------------+
```

1.  **Capa de Aplicaciones:** El clúster de Kubernetes en la región secundaria está aprovisionado a una capacidad mínima (10%) para ahorrar costos, pero listo para escalar horizontalmente mediante scripts de Terraform e imágenes de contenedores en caché local.
2.  **Capa de Datos:** Se utiliza **Aurora Global Database**. Los datos se replican físicamente a nivel del motor de almacenamiento a la región secundaria en menos de 1 segundo (RPO cercano a cero).
3.  **Proceso de Failover:** Si la región principal sufre un apagón:
    *   Los sistemas de monitoreo y DNS global (ej. Route 53) redirigen el tráfico de red de las operadoras y PNP a la región secundaria.
    *   La base de datos Aurora en la región secundaria se promueve automáticamente a escritora (Writer).
    *   El autoescalador Karpenter en el clúster EKS secundario aprovisiona nodos adicionales en 60 segundos para absorber el 100% del tráfico transaccional nacional.

---

## 3. Monitoreo, Alertas y Observabilidad

Para asegurar visibilidad operativa, auditoría forense y mitigación rápida de fallas, se implementa un stack de observabilidad distribuido.

### 3.1. Stack Tecnológico de Observabilidad
*   **Métricas:** Prometheus Server recolecta métricas de rendimiento de Kubernetes, tiempos de respuesta de microservicios y latencias de APIs externas.
*   **Visualización y Dashboards:** Grafana consolidará paneles de control visibles para el Centro de Monitoreo de OSIPTEL.
*   **Trazabilidad:** OpenTelemetry (OTel) para rastrear de extremo a extremo el ciclo de vida de una petición (ej. registrar desde que ingresa a `SIPBA-GW`, pasa por el cálculo de reglas en `SIPBA-CORE`, llama a RENIEC, y escribe en PostgreSQL y Kafka).
*   **Logs Centralizados:** Agentes FluentBit recolectan logs de contenedores, enmascaran campos sensibles y los envían a un clúster seguro de OpenSearch para indexación y búsqueda.

### 3.2. Dashboards y Métricas Clave de Negocio (KPIs)

```
+---------------------------------------------------------------------------+
| OSIPTEL - PANEL DE MONITOREO SIPBA                                        |
|                                                                           |
|  [ Transacciones/Seg ]     [ Latencia Core ]     [ Latencia RENIEC ]      |
|  >>  145 TPS               >>  32 ms             >>  380 ms               |
|                                                                           |
|  [ Tasa Éxito Biométrico ] [ Estado Colas Kafka ] [ Estado Operadoras ]    |
|  >>  92.4% Conforme        >>  Lag: 0 ms         >>  4/4 Conectadas       |
+---------------------------------------------------------------------------+
```

### 3.3. Esquema de Alertas de Seguridad y Operaciones

El motor de alertas (Alertmanager) notificará de inmediato mediante canales seguros (Slack/PagerDuty/SMS) al equipo de guardia ante las siguientes anomalías:

1.  **Alerta: Falla Crítica en RENIEC**
    *   *Regla:* Tasa de error 5xx en la llamada biométrica de RENIEC $> 5\%$ en una ventana de 2 minutos.
    *   *Acción:* Alerta crítica. Se activa el protocolo de Circuit Breaker para degradación del servicio a canales presenciales regulados.
2.  **Alerta: Intento de Suplantación en Distribuidor (Posible Fraude)**
    *   *Regla:* Un mismo ID de `token_distribuidor` registra $> 3$ fallos consecutivos de cotejo biométrico (score $< 40\%$) en menos de 10 minutos para diferentes DNIs.
    *   *Acción:* Bloqueo automático preventivo del distribuidor en el clúster de Redis (estado cambiado a `INACTIVO`) y generación de alerta a la unidad de fiscalización de OSIPTEL.
3.  **Alerta: Retraso en Cola de Bloqueos (Kafka Lag)**
    *   *Regla:* El retardo de consumo de mensajes (Lag) en el tópico `solicitudes-bloqueo` por parte de alguna operadora móvil supera los 100 mensajes.
    *   *Acción:* Indica que los sistemas de la operadora no están procesando las suspensiones de equipos robados en tiempo real. Alerta de nivel medio que gatilla revisión del SLA.

---
*Nota: Este entregable de seguridad y observabilidad completa el diseño detallado para la Fase D (Arquitectura Tecnológica). Todos los componentes y diagramas están listos para ser presentados ante el Comité de Arquitectura y Gobernanza del Regulador.*
