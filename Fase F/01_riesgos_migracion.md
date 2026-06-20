# Análisis de Riesgos y Mitigación (Fase F)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable detalla la **Gestión de Riesgos de la Migración** para el proyecto SIPBA. Debido a la naturaleza crítica de las redes móviles nacionales, cualquier fallo en la transición podría afectar el comercio nacional o la seguridad pública. Se identifican las amenazas clave, se clasifica su probabilidad e impacto, y se definen planes de contingencia para mitigar su ocurrencia.

---

## 1. Identificación y Análisis de Riesgos Críticos

### 🚨 Riesgo R-1: Demoras en la Adaptación de las Operadoras
*   **Descripción:** Resistencia comercial o retraso técnico por parte de una o más operadoras móviles para modificar sus sistemas de facturación y cores de red (HLR/EIR) para integrarse con las APIs de SIPBA.
*   **Impacto de Negocio:** Retrasa la puesta en marcha de la suspensión automática (AT1) y la validación en punto de venta (AT2).
*   **Clasificación:** Probabilidad **Alta**, Impacto **Crítico**.

### 🚨 Riesgo R-2: Degradación del Servicio o Timeouts de RENIEC
*   **Descripción:** El servicio web biométrico de RENIEC no soporta la carga concurrente nacional de consultas síncronas en hora punta (latencias $> 2000$ ms o caídas de plataforma).
*   **Impacto de Negocio:** Caída del comercio a nivel nacional; los usuarios en tiendas no pueden comprar o activar chips telefónicos.
*   **Clasificación:** Probabilidad **Media**, Impacto **Crítico**.

### 🚨 Riesgo R-3: Discrepancias de Calidad de Datos en la Ingesta Masiva
*   **Descripción:** Al cargar los 40 millones de registros históricos iniciales, se detectan datos de baja calidad (DNI de ciudadanos fallecidos, líneas activas con múltiples titulares, IMEIs mal formateados).
*   **Impacto de Negocio:** Registro inicial contaminado en SIPBA, provocando bloqueos erróneos o fallos en la validación de límites de líneas.
*   **Clasificación:** Probabilidad **Alta**, Impacto **Medio**.

### 🚨 Riesgo R-4: Falsos Positivos de Bloqueo por Geolocalización en Zonas Rurales
*   **Descripción:** El motor de reglas deniega activaciones legítimas en provincias o áreas alejadas porque el dispositivo de ventas no captura coordenadas GPS válidas o las marcas de tiempo difieren por problemas de señal.
*   **Impacto de Negocio:** Discriminación digital de poblaciones rurales y quejas masivas contra el regulador.
*   **Clasificación:** Probabilidad **Media**, Impacto **Alto**.

---

## 2. Matriz de Evaluación de Riesgos (Probabilidad vs. Impacto)

```
        Crítico |   [R-1: Retrasos Operadoras]  |   [R-2: Caída de RENIEC]
   I            |                               |   
   M    --------+-------------------------------+------------------------------
   P      Alto  |                               |   [R-4: Fallos GPS Rural]
   A            |                               |   
   C    --------+-------------------------------+------------------------------
   T      Medio |   [R-3: Datos Históricos Sucios]|   
   O            |                               |   
        --------+-------------------------------+------------------------------
                        Baja                         Media / Alta
                                    PROBABILIDAD
```

---

## 3. Planes de Contingencia y Mitigación

Para proteger la estabilidad operativa de la red móvil nacional, se definen los siguientes planes de respuesta ante incidentes:

| ID | Riesgo | Estrategia de Mitigación (Preventiva) | Plan de Contingencia (Correctiva) |
| :--- | :--- | :--- | :--- |
| **R-1** | Retrasos de Operadoras | **Gobernanza Contractual:** Establecer la obligatoriedad de la homologación de APIs en el reglamento de la Fase Preliminar, con multas administrativas por cada mes de retraso. | **Despliegue Asimétrico:** Lanzar el Go-Live de la plataforma operadora por operadora. Las operadoras adaptadas operan en tiempo real, mientras que las rezagadas mantienen el flujo batch heredado con fiscalización redoblada de la GFS. |
| **R-2** | Caída de RENIEC | **Arquitectura de Circuit Breaker:** Definida en la [Arquitectura de Aplicaciones](file:///D:/aempre/Fase%20C/02_arquitectura_aplicaciones.md#L4-L4). Desconexión automática del API síncrono al superar el 5% de error. | **Bypass Seguro Ex-Post:** Transición a validación de huella tradicional y declaración física (degradada offline) con auditoría posterior obligatoria a través del pipeline Spark. |
| **R-3** | Datos Históricos Sucios | **Pipeline de Sanitización:** Diseñar un pipeline de pre-procesamiento Spark que valide formatos, excluya de forma automática registros con DNI fallecidos (cruce con padrón RENIEC) y mande a cuarentena anomalías para fiscalización previa de GFS. | **Carga Parcial Progresiva:** Inicializar la base de datos de SIPBA en "Modo Lectura/Escritura Híbrido". Los números corruptos o sin DNI válido en el dump se inhabilitan en la red móvil tras un periodo de gracia de 30 días para su regularización presencial. |
| **R-4** | Fallos GPS Rural | **Umbral de Tolerancia Espacial:** Permitir en el motor de reglas un fallback de validación en caso de que la antena celular (Cell ID) corresponda a una zona rural catalogada sin cobertura GPS estable. | **Exclusión Geográfica:** Mantener una base de datos georreferenciada en Redis de los distritos rurales excluidos de la validación estricta de GPS en el core de reglas. |

---
*Nota: La ejecución de estos planes y presupuestos requeridos para el equipo de respuesta rápida ante contingencias se incorporan en la Estimación de Costos y Recursos ([02_estimacion_recursos.md](file:///D:/aempre/Fase%20F/02_estimacion_recursos.md)).*
