# Hoja de Ruta e Incrementos de Transición (Fase E)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable define la **Hoja de Ruta de Implementación** y las **Arquitecturas de Transición (Transition Architectures)** para el proyecto SIPBA. Se estructuran tres incrementos lógicos para mitigar riesgos de gobernanza, asegurar la continuidad operativa de los servicios de telefonía del país y priorizar las iniciativas de mayor valor para combatir la extorsión.

---

## 1. Definición de las Arquitecturas de Transición

La implementación de SIPBA se divide en tres fases incrementales a lo largo de un año:

```
+-----------------------------------------------------------------------------------+
| ROADMAP SIPBA (12 MESES)                                                          |
|                                                                                   |
|  [ AT1: Conectividad y Bloqueo ] --> [ AT2: Activación y Reglas ] --> [ AT3: HSM ]|
|  - Meses 1 - 4                      - Meses 5 - 8                    - Meses 9 -12|
+-----------------------------------------------------------------------------------+
```

### 1.1. Arquitectura de Transición 1 (AT1): "Conectividad y Canal de Bloqueo Inmediato"
*   **Periodo:** Meses 1 al 4.
*   **Enfoque de Negocio:** Prioriza la inhabilitación inmediata del servicio celular por robo, pérdida o extorsión. Ataca directamente la extorsión rápida reduciendo el SLA de suspensión de 24h a < 1h.
*   **Alcance Técnico:**
    *   Implementación de la infraestructura base en la nube (VPC, clúster EKS, base transaccional vacía, clúster Kafka MSK).
    *   Configuración de canales seguros mTLS/VPN con la PNP (DIVINDAT) y las 4 operadoras.
    *   Despliegue del API de Bloqueo y suscripción asíncrona de las operadoras a la cola Kafka.
*   **Estado de los Procesos:**
    *   *Nuevas Activaciones:* Continúan operando bajo el modelo antiguo de las operadoras sin validación síncrona en OSIPTEL.
    *   *Bloqueos por Robo:* Se procesan en tiempo real vía SIPBA (PNP $\rightarrow$ SIPBA $\rightarrow$ Redes Operadoras).

---

### 1.2. Arquitectura de Transición 2 (AT2): "Gobernanza y Validación en Punto de Venta"
*   **Periodo:** Meses 5 al 8.
*   **Enfoque de Negocio:** Erradicar la suplantación de identidad (*SIM Swapping*) en el origen al centralizar el control y obligar a la validación biométrica facial real.
*   **Alcance Técnico:**
    *   Integración del core transaccional `SIPBA-CORE` con el API biométrico de RENIEC.
    *   Despliegue de la API de Activación. Las operadoras adaptan sus sistemas de ventas (CRM/Apps) para consumir esta API obligatoriamente.
    *   Activación del motor de reglas (límite de 7 líneas, estado de distribuidor y lista negra).
    *   Implementación de Redis para control de concurrencia y rate limiting.
*   **Estado de los Procesos:**
    *   *Nuevas Activaciones:* 100% reguladas y validadas síncronamente por SIPBA en menos de 2 segundos.
    *   *Bloqueos por Robo:* Operando en tiempo real de forma estable.

---

### 1.3. Arquitectura de Transición 3 (AT3): "Fiscalización Analítica y Hardening Tecnológico"
*   **Periodo:** Meses 9 al 12.
*   **Enfoque de Negocio:** Garantizar la consistencia estadística total del mercado (cierre de portabilidad y altas irregulares) y robustecer la seguridad nacional de los datos.
*   **Alcance Técnico:**
    *   Despliegue y automatización del pipeline batch `SIPBA-ETL` en Spark/Airflow.
    *   Integración física de los microservicios con el clúster **HSM** (Hardware Security Module) de OSIPTEL para firmas digitales y cifrado en base de datos.
    *   Aprovisionamiento de la arquitectura Multi-Región en la nube y pruebas de simulación de desastres (DRP/Chaos Engineering).
    *   Liberación de los tableros analíticos de riesgo en la GFS.
*   **Estado de los Procesos:**
    *   *Nuevas Activaciones y Bloqueos:* Operando en producción bajo entorno blindado (HSM) y redundante.
    *   *Fiscalización:* Automatizada al 100%. Generación nocturna de expedientes sancionadores automáticos por discrepancias de ventas de operadoras.

---

## 2. Cronograma de Implementación (Mermaid Gantt)

El siguiente diagrama detalla la ruta crítica de desarrollo de los Paquetes de Trabajo (WP) y su correspondencia con las Arquitecturas de Transición (AT):

```mermaid
gantt
    title Cronograma General de Implementación SIPBA
    dateFormat  YYYY-MM-DD
    axisFormat  %m/2026
    
    section Arquitecturas de Transición
    AT1: Conectividad y Canal de Bloqueo   :active, des1, 2026-06-01, 2026-09-30
    AT2: Activación y Reglas de Negocio    :      des2, 2026-10-01, 2026-01-31
    AT3: Fiscalización y Hardening HSM     :      des3, 2027-02-01, 2027-05-31

    section WP1: Infraestructura y Redes
    Aprovisionamiento de Nube y VPC        :crit, wp1_1, 2026-06-01, 2026-07-15
    Conectividad VPN/Direct Connect (mTLS) :crit, wp1_2, 2026-07-16, 2026-09-15
    Pruebas de Conectividad Inter-Entidad  :      wp1_3, 2026-09-16, 2026-09-30

    section WP2: Core e Integración Pública
    Desarrollo API Gateway y Core Rules   :crit, wp2_1, 2026-07-01, 2026-10-15
    Integración Síncrona con RENIEC       :crit, wp2_2, 2026-10-16, 2026-12-15
    Pruebas en Modo Sombra (Shadow Mode)   :      wp2_3, 2026-12-16, 2026-01-31

    section WP3: Integración Operadoras
    Despliegue Clúster Kafka (AWS MSK)    :      wp3_1, 2026-08-01, 2026-09-15
    Homologación Cola Bloqueo (Operadoras) :crit, wp3_2, 2026-09-16, 2026-11-30
    Migración Flujo de Activación Telcos  :crit, wp3_3, 2026-12-01, 2026-01-31

    section WP4: Analítica y Fiscalización
    Desarrollo Pipeline ETL Spark         :      wp4_1, 2027-02-01, 2027-03-31
    Integración con HSM de OSIPTEL        :crit, wp4_2, 2027-03-01, 2027-04-30
    Despliegue Tableros GFS y Cierre      :      wp4_3, 2027-05-01, 2027-05-31
```

---

## 3. Ruta Crítica y Dependencias Técnicas

Para evitar retrasos en el proyecto, el Comité de Arquitectura debe monitorear las siguientes dependencias clave:

1.  **Conectividad Física de Redes (WP1 $\rightarrow$ WP3):** Las operadoras móviles no pueden iniciar la integración de sus colas de bloqueo (Kafka) hasta que se completen los enlaces físicos dedicados (Direct Connect / VPNs) del WP1. Cualquier retraso en la adquisición de enlaces retrasa el hito AT1.
2.  **Línea Base de RENIEC (WP2 $\rightarrow$ AT2):** La integración síncrona con RENIEC requiere la entrega de credenciales y APIs productivas con tasas de respuesta menores a 500ms. Si RENIEC presenta inestabilidad, impacta la salida en vivo de la validación biométrica de la AT2.
3.  **Certificación del HSM (WP4 $\rightarrow$ AT3):** La integración final con el Hardware Security Module físico requiere la configuración de controladores PKCS#11 seguros en el clúster Kubernetes. Esta tarea se programa en la fase final de hardening debido a su alta complejidad en configuraciones de red híbrida.

---
*Nota: Para garantizar la estabilidad de las transacciones durante la transición entre las arquitecturas AT1, AT2 y AT3, se implementará el Plan de Coexistencia de Sistemas y Migración detallado en ([03_plan_coexistencia.md](file:///D:/aempre/Fase%20E/03_plan_coexistencia.md)).*
