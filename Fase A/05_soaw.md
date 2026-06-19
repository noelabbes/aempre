# Declaración de Trabajo de Arquitectura (Statement of Architecture Work - SoAW)
## Proyecto: Sistema de Identidad Personal y Bloqueo Automático (SIPBA) - OSIPTEL

---

### 1. Información General del Proyecto

| Campo | Detalle |
| :--- | :--- |
| **Nombre del Proyecto** | Sistema de Identidad Personal y Bloqueo Automático (SIPBA) |
| **Patrocinador Principal** | Presidencia del Consejo Directivo y Gerencia General de OSIPTEL |
| **Organizaciones Clave** | OSIPTEL (GTIC, GFS, GU), RENIEC (GTI), PNP (DIVINDAT), Operadoras (AFIN) |
| **Fecha de Inicio** | Junio 2026 |
| **Versión del SoAW** | 1.0 |
| **Estado** | Propuesto para Aprobación del Architecture Board |

---

### 2. Propósito y Objetivos del Proyecto

El propósito de este SoAW es formalizar el compromiso institucional y técnico para el diseño e implementación de la arquitectura empresarial de **SIPBA**. Este sistema transformará a OSIPTEL en el garante y orquestador del ecosistema de identidad móvil en Perú, combatiendo directamente el SIM Swapping y la extorsión digital.

#### Objetivos de Arquitectura (Metas SMART):
*   **Reducción del Tiempo de Bloqueo (SLA):** Pasar de una latencia de 24 horas (procesamiento batch/manual) a **menos de 1 hora** (tiempo real basado en eventos) ante denuncias de suplantación.
*   **Cobertura Biométrica Obligatoria:** Garantizar la verificación biométrica con detección de prueba de vida (*Liveness Detection*) para el **100% de las activaciones críticas** (altas, reposición de chip) en un plazo de **12 meses**.
*   **Mitigación de Fraude:** Lograr una reducción mínima proyectada del **80%** en casos de suplantación de identidad móvil en los primeros 6 meses de operación.
*   **Veracidad de Datos:** Consolidar el linaje y reconciliación automática de líneas reportadas por operadores para erradicar inconsistencias estadísticas en el sector.

---

### 3. Alcance de los Trabajos de Arquitectura

El alcance se define a través de las capas de arquitectura del ciclo ADM de TOGAF adaptado para OSIPTEL:

#### A. En Alcance (In-Scope):
*   **Arquitectura de Negocio:**
    *   Rediseño y optimización (BPMN) de los procesos de activación con biometría, bloqueo inmediato de líneas por denuncias PNP y penalizaciones automáticas a distribuidores.
    *   Integración operativa del flujo de quejas masivas en la Gerencia de Usuarios (GU) con la automatización del Hub.
*   **Arquitectura de Datos:**
    *   Definición del modelo de datos de auditoría de validaciones biométricas (tokens, scores, timestamps) asegurando cumplimiento con la LPDP (Ley 29733).
    *   Definición de metadatos de linaje de datos para el seguimiento de líneas móviles reportadas por operadoras.
*   **Arquitectura de Aplicación:**
    *   Diseño lógico y estándares de seguridad del API Gateway SIPBA perimetral (autenticación mTLS, OAuth 2.0, Rate Limiting y firmas JWT).
    *   Especificación del motor de reglas de negocio en tiempo real (Límite de 7 líneas por titular, 3-strikes de distribuidores).
*   **Arquitectura de Tecnología:**
    *   Diseño de la infraestructura híbrida y buses de mensajería (RabbitMQ/Kafka) para soportar el procesamiento asíncrono y tolerante a fallos de eventos de bloqueo.

#### B. Fuera de Alcance (Out-of-Scope):
*   Implementación física o codificación del software core de las operadoras móviles (las operadoras son responsables del desarrollo de sus adaptadores).
*   Despliegue y mantenimiento de los sistemas de denuncias internas de la PNP o la base biométrica nacional de RENIEC.
*   Modificaciones legislativas directas al DL 1738 (SIPBA se ciñe a la ley vigente, aportando el soporte tecnológico y normativo).

---

### 4. Plan de Trabajo y Cronograma de Entregables (ADM TOGAF)

| Fase ADM | Entregable Clave | Fecha Estimada | Responsable |
| :--- | :--- | :---: | :--- |
| **Fase A (Visión)** | Architecture Vision & SoAW Aprobado | T0 + 2 semanas | GTIC / Gerencia General |
| **Fase B (Negocio)** | Process Definition & Gap Analysis (BPMN) | T0 + 5 semanas | GFS / GU / Analistas |
| **Fase C (Sistemas)**| Logical Data Model, API Specs & Application Map | T0 + 8 semanas | GTIC / Arquitecto de APIs |
| **Fase D (Tecnología)**| Technology Architecture & Network Topology Diagram| T0 + 10 semanas| GTIC / Ciberseguridad |
| **Fase E/F (Roadmap)**| Roadmap de Transición y Plan de Migración | T0 + 12 semanas| Comité de AE / Finanzas |

---

### 5. Riesgos, Restricciones y Supuestos

#### Riesgos Técnicos y de Gobernanza:
1.  **Inestabilidad Política y Rotación Ejecutiva:** Cambios continuos en la PCM o la dirección de OSIPTEL que pongan en riesgo el patrocinio. *Mitigación:* Institucionalizar el Comité de AE en el Reglamento de Organización y Funciones (ROF) y depositar los planos en el Repositorio de AE.
2.  **Resistencia de Operadoras Móviles:** Oposición por costos de integración técnica y potencial fricción en ventas. *Mitigación:* Demostrar mediante la arquitectura de negocio el retorno de inversión y reducción de multas.
3.  **Indisponibilidad de RENIEC (SPOF):** Caídas de latencia en la base biométrica nacional. *Mitigación:* Implementar colas de reintentos y "Shadow Mode" de validación para control de contingencias.

#### Restricciones:
*   **Presupuesto:** Límite financiero ajustado a la tarifa regulatoria de OSIPTEL.
*   **Seguridad:** Cumplimiento irrestricto de la Ley de Protección de Datos Personales (prohibido almacenar fotos de rostros en OSIPTEL).
*   **SLA:** Las validaciones de identidad en línea no deben exceder una latencia perimetral de 3 segundos.

---

### 6. Gobernanza y Aprobación de la Arquitectura

Este documento actúa como contrato oficial entre la Jefatura del Proyecto de Arquitectura y la Alta Dirección de OSIPTEL. Cualquier desviación del alcance, los principios de arquitectura aprobados en la Fase Preliminar, o los objetivos del BMM requerirá una solicitud formal de cambio (Change Request) revisada y aprobada por el Comité de AE.

**Aprobado por:**
*   _______________________________________ (Gerente General de OSIPTEL)
*   _______________________________________ (Gerente de la GTIC / Arquitecto Líder)
