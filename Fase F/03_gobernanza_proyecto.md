# Marco de Gobernanza del Proyecto (Fase F)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable establece el **Marco de Gobernanza y Control** para la ejecución y operación sostenible del sistema SIPBA. Define los roles directivos, el proceso formal de auditoría de conformidad para las operadoras telefónicas y los acuerdos de nivel de servicio (SLA) para soporte de incidentes en producción.

---

## 1. Estructura del Comité de Gobernanza y Arquitectura

Para supervisar el cumplimiento de la hoja de ruta y dirimir controversias técnicas o comerciales entre operadoras, se crea el **Comité de Gobernanza SIPBA**:

```
                  +----------------------------------------------+
                  |           PRESIDENCIA DEL COMITÉ             |
                  |          (Consejo Directivo OSIPTEL)         |
                  +----------------------+-----------------------+
                                         |
                                         v
                  +----------------------------------------------+
                  |         COMITÉ DE ARQUITECTURA CORE          |
                  |   (Gerente GTIC, Gerente GFS, Gerente GU)    |
                  +----------------------+-----------------------+
                                         |
            +----------------------------+----------------------------+
            |                            |                            |
            v                            v                            v
+------------------------+   +------------------------+   +------------------------+
| REPRE. TÉCNICO RENIEC  |   |   REPRE. TÉCNICO PNP   |   | REPRE. TÉCNICOS TELCOS |
| (Validación Biometría) |   | (DIVINDAT / Denuncias) |   |  (Claro/Movi/Ent/Bit)  |
+------------------------+   +------------------------+   +------------------------+
```

### 1.1. Roles y Responsabilidades Clave
*   **Consejo Directivo de OSIPTEL (Presidencia):** Dirección estratégica y autoridad sancionadora definitiva ante incumplimientos graves de las operadoras móviles.
*   **GTIC (Dirección Técnica de Arquitectura):** Lidera el Comité de Arquitectura Core. Responsable de custodiar el diseño del sistema, emitir y revocar certificados mTLS y auditar el código fuente del API Gateway.
*   **Gerencia de Supervisión (GFS) (Auditoría Operativa):** Responsable de evaluar el cumplimiento de las operadoras respecto a los tiempos de inhabilitación (SLA de bloqueo) y aplicar sanciones administrativas.
*   **Representantes Externos (RENIEC, PNP y Operadoras):** Enlaces técnicos designados para la resolución de fallas complejas de interoperabilidad, mantenimiento de túneles VPN y aseguramiento de la red móvil.

---

## 2. Proceso de Revisión de Conformidad (Architecture Compliance)

Antes de que una operadora móvil reciba la llave de producción para conectarse al SIPBA, debe someterse a una **Auditoría de Conformidad** dirigida por la GTIC.

```
 [Fase Desarrollo] ---> [1. Pruebas Sandbox] ---> [2. Auditoría Seguridad] ---> [3. Pruebas Carga] ---> [Pase Producción (mTLS)]
```

### 2.1. Criterios de Evaluación Obligatorios
Para obtener la certificación de homologación de OSIPTEL, la operadora debe superar las siguientes pruebas de laboratorio:

1.  **Conformidad de Interfaz (API Contracts):**
    *   La operadora debe consumir e interpretar correctamente los payloads JSON definidos en [Interfaces e Integraciones (Fase C)](file:///D:/aempre/Fase%20C/03_integracion_sistemas.md).
    *   Verificación de que las respuestas HTTP 4xx y 5xx son manejadas correctamente en el CRM del operador (sin reintentos infinitos que inunden la red).
2.  **Seguridad y Cifrado:**
    *   Instalación exitosa del túnel VPN e intercambio mTLS.
    *   Validación de que la cabecera `X-Signature` sea generada y firmada con criptografía fuerte (SHA256withRSA) utilizando la llave privada propia de la operadora.
3.  **SLA de Redes y Core Móvil:**
    *   Demostración de que la orden de bloqueo consumida de la cola Kafka se ejecuta en sus HLR/EIR en un SLA real menor a 15 minutos (medido mediante inyección de logs simulados).

---

## 3. Acuerdos de Nivel de Servicio (SLA) de Soporte en Producción

Para garantizar que un fallo en la plataforma SIPBA no interrumpa la activación de servicios a nivel nacional de forma prolongada, se establece la siguiente matriz de priorización y SLAs de soporte interinstitucional:

| Severidad de Falla | Descripción del Incidente | Tiempo de Respuesta (SLA) | Tiempo de Resolución (SLA) | Plan de Escalado |
| :---: | :--- | :---: | :---: | :--- |
| **S-1 (Crítica)** | Caída completa del API Gateway de SIPBA, bloqueo del clúster EKS, o caída persistente del API biométrico de RENIEC ($> 5$ minutos). | $< 5$ minutos | $< 30$ minutos | Alerta directa al Gerente de GTIC y Directores de Tecnología de las Operadoras. Activación del modo contingencia biométrica offline. |
| **S-2 (Alta)** | El lag de la cola Kafka de alguna operadora móvil supera los 100 mensajes, o falla de carga del ETL nocturno que retrasa la reconciliación diaria. | $< 1$ hora | $< 8$ horas | Alerta al Administrador de Base de Datos y DevOps. Intervención del soporte B2B del operador móvil para destrabar el microservicio. |
| **S-3 (Baja)** | Errores menores de consulta en el portal ciudadano, o latencia puntual sin pérdida de mensajes en reportes no críticos. | $< 4$ horas | $< 24$ horas | Reporte rutinario en mesa de ayuda de OSIPTEL para resolución en horario de oficina. |

---
*Nota: La aprobación de este Marco de Gobernanza por el Comité Directivo de OSIPTEL completa formalmente las fases Preliminar, A, B, C, D, E y F de la Metodología ADM de TOGAF para la implementación del Hub Transaccional SIPBA. El proyecto queda listo para su fase de construcción y pase a producción.*
