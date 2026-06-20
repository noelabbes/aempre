# Arquitectura Empresarial OSIPTEL – Proyecto SIPBA
## Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este repositorio documenta el diseño completo de la **Arquitectura Empresarial (Target)** para el Proyecto SIPBA de OSIPTEL (Organismo Supervisor de la Inversión Privada en Telecomunicaciones, Perú), estructurado bajo la metodología **ADM de TOGAF (fases de la Preliminar a la H)**. 

El proyecto tiene como visión convertir a OSIPTEL en el garante de un ecosistema móvil seguro, reduciendo a cero el anonimato y combatiendo de forma integral la extorsión digital y el fraude por suplantación de identidad (*SIM Swapping*).

---

## 1. Alineación Estratégica con los Desafíos de OSIPTEL (OCDE 2023)

El diseño del SIPBA no es una reingeniería de procesos aislada ni un simple aplicativo de intermediación. Es una transformación de capacidades organizativas orientada a resolver las debilidades institucionales del regulador:

*   **Fiscalización Basada en Riesgos:** En línea con las recomendaciones de la **OCDE (Bajo la metodología PAFER)**, la Gerencia de Supervisión y Fiscalización (GFS) evoluciona de un modelo de inspección física aleatoria hacia una fiscalización predictiva y automatizada orientada a datos y alertas de comportamiento en tiempo real.
*   **Reducción de Reclamos en la Fuente:** Al interceptar y denegar de forma síncrona las activaciones irregulares en los puntos de venta, el sistema reduce drásticamente el flujo de quejas por líneas no reconocidas, disminuyendo la carga operativa (OpEx) de la Gerencia de Usuarios (GU).
*   **Transparencia y Credibilidad del Mercado:** El pipeline de reconciliación diaria del SIPBA cruza las conexiones activas comerciales de las operadoras contra las transacciones aprobadas por OSIPTEL, proporcionando una **Fuente Única de Verdad** estadística y auditable para el mercado peruano.
*   **Independencia Regulatoria:** Las reglas de negocio (como el límite de 7 líneas o los "3 Strikes" a distribuidores) se automatizan y firman criptográficamente mediante un clúster HSM físico, eliminando la discrecionalidad administrativa y blindando al regulador contra presiones externas.

---

## 2. Índice del Repositorio de Arquitectura (TOGAF ADM)

A continuación se presenta el mapa de entregables del repositorio, organizados por las fases del ciclo ADM:

### 🌐 [Fase Preliminar: Marco de Arquitectura y Principios](file:///D:/aempre/Fase%20Preliminar/)
*   📄 [Capacidad y Metamodelo](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/01_capacidad.md) — Definición de roles del Comité de AE, modelo de madurez y matriz RACI.
*   📄 [Principios de Arquitectura](file:///D:/aempre/Fase%20Preliminar/Repositorio_Arquitectura/01_Capacidad_y_Metamodelo/03_principios.md) — 9 principios institucionales (Seguridad, Autonomía, Fiscalización basada en riesgos).
*   📄 [Marco de Arquitectura a Medida](file:///D:/aempre/Fase%20Preliminar/Marco_de_Arquitectura.md/Marco%20de%20Arquitectura%20a%20Medida.md) — Adaptación de la terminología de TOGAF a la realidad de OSIPTEL, SEGDI y PIDE.

### 🎯 [Fase A: Visión de Arquitectura](file:///D:/aempre/Fase%20A/)
*   📄 [01_vision.md](file:///D:/aempre/Fase%20A/01_vision.md) — Visión de arquitectura del TO-BE, conceptos clave y alcance.
*   📄 [02_bmm.md](file:///D:/aempre/Fase%20A/02_bmm.md) — Business Motivation Model (BMM): metas, objetivos SMART e influenciadores.
*   📄 [03_stakeholders.md](file:///D:/aempre/Fase%20A/03_stakeholders.md) — Matriz Poder/Interés y mapa de compromisos (RENIEC, PNP, Telcos).
*   📄 [05_soaw.md](file:///D:/aempre/Fase%20A/05_soaw.md) — Statement of Architecture Work: contrato y planificación del proyecto.

### 🏢 [Fase B: Arquitectura de Negocio](file:///D:/aempre/Fase%20B/)
*   📄 [01_procesos_negocio.md](file:///D:/aempre/Fase%20B/01_procesos_negocio.md) — Modelado BPMN de los procesos de Activación Biométrica, Denuncias PNP y Sanciones.
*   📄 [02_catalogo_organizacion.md](file:///D:/aempre/Fase%20B/02_catalogo_organizacion.md) — Catálogo organizativo de OSIPTEL y el **Rediseño de la GFS** (Capacitación y perfiles de Analistas Forenses).
*   📄 [03_requerimientos_negocio.md](file:///D:/aempre/Fase%20B/03_requerimientos_negocio.md) — Requerimientos de calidad, SLAs y privacidad (LPDP).
*   📄 [04_gap_analysis_negocio.md](file:///D:/aempre/Fase%20B/04_gap_analysis_negocio.md) — Matriz de brechas (AS-IS vs. TO-BE) e impactos institucionales.

### 💻 [Fase C: Arquitectura de Sistemas de Información](file:///D:/aempre/Fase%20C/)
*   📄 [00_plan_fase_c.md](file:///D:/aempre/Fase%20C/00_plan_fase_c.md) — Plan de trabajo de Sistemas de Información.
*   📄 [01_arquitectura_datos.md](file:///D:/aempre/Fase%20C/01_arquitectura_datos.md) — Modelo conceptual de datos, linaje de datos y no persistencia biométrica (LPDP).
*   📄 [02_arquitectura_aplicaciones.md](file:///D:/aempre/Fase%20C/02_arquitectura_aplicaciones.md) — Catálogo del Portafolio lógico (API Gateway, Core Rules, Kafka Broker, Spark ETL).
*   📄 [03_integracion_sistemas.md](file:///D:/aempre/Fase%20C/03_integracion_sistemas.md) — Especificación física de APIs y Payloads JSON (Activación, Bloqueos, Webhooks, Consulta).

### 🖥️ [Fase D: Arquitectura Tecnológica](file:///D:/aempre/Fase%20D/)
*   📄 [00_plan_fase_d.md](file:///D:/aempre/Fase%20D/00_plan_fase_d.md) — Plan de trabajo de infraestructura y hardware.
*   📄 [01_infraestructura_redes.md](file:///D:/aempre/Fase%20D/01_infraestructura_redes.md) — Topología de red híbrida, VPC en la nube, clúster EKS Kubernetes y enlaces mTLS/VPN.
*   📄 [02_plataformas_datos.md](file:///D:/aempre/Fase%20D/02_plataformas_datos.md) — Clúster Apache Kafka (AWS MSK), PostgreSQL Aurora Multi-AZ y Redis Cluster.
*   📄 [03_seguridad_resiliencia.md](file:///D:/aempre/Fase%20D/03_seguridad_resiliencia.md) — Integración con HSM (FIPS 140-3 Nivel 3), plan de DRP Warm Standby (RTO < 15m, RPO < 1m) y stack de observabilidad.

### 🗓️ [Fase E: Oportunidades y Soluciones](file:///D:/aempre/Fase%20E/)
*   📄 [00_plan_fase_e.md](file:///D:/aempre/Fase%20E/00_plan_fase_e.md) — Hoja de ruta para paquetes de trabajo.
*   📄 [01_paquetes_trabajo.md](file:///D:/aempre/Fase%20E/01_paquetes_trabajo.md) — Clasificación de los 4 proyectos de software/redes (WP1 al WP4) y priorización Valor vs. Esfuerzo.
*   📄 [02_arquitecturas_transicion.md](file:///D:/aempre/Fase%20E/02_arquitecturas_transicion.md) — Cronograma general en Mermaid Gantt e hitos operativos de las transiciones (AT1, AT2, AT3).
*   📄 [03_plan_coexistencia.md](file:///D:/aempre/Fase%20E/03_plan_coexistencia.md) — Migración batch de 40M de registros, coexistencia Kafka vs. archivos RENTESEG y plan de contingencia por caídas de RENIEC.

### 📋 [Fase F: Planificación de la Migración](file:///D:/aempre/Fase%20F/)
*   📄 [00_plan_fase_f.md](file:///D:/aempre/Fase%20F/00_plan_fase_f.md) — Plan de trabajo de riesgos y gobernanza del proyecto.
*   📄 [01_riesgos_migracion.md](file:///D:/aempre/Fase%20F/01_riesgos_migracion.md) — Matriz de evaluación de riesgos (RENIEC timeouts, GPS rural, retrasos telcos) y contingencias.
*   📄 [02_estimacion_recursos.md](file:///D:/aempre/Fase%20F/02_estimacion_recursos.md) — Estructura financiera estimada de CapEx (\$485,000) y OpEx (\$32,000/mes) y asignación de personal.
*   📄 [03_gobernanza_proyecto.md](file:///D:/aempre/Fase%20F/03_gobernanza_proyecto.md) — Organigrama del Comité SIPBA y SLAs de mesa de soporte.

### ⚖️ [Fase G: Gobernanza de la Implementación](file:///D:/aempre/Fase%20G/)
*   📄 [00_plan_fase_g.md](file:///D:/aempre/Fase%20G/00_plan_fase_g.md) — Plan de trabajo de gobernanza de la fase de construcción.
*   📄 [01_contrato_arquitectura.md](file:///D:/aempre/Fase%20G/01_contrato_arquitectura.md) — Acuerdo formal y métricas técnicas exigibles de performance, disponibilidad y sanciones.
*   📄 [02_revisiones_conformidad.md](file:///D:/aempre/Fase%20G/02_revisiones_conformidad.md) — Guía de auditoría en 3 fases, checklist técnica y plantilla del Reporte de Conformidad.
*   📄 [03_recomendaciones_despliegue.md](file:///D:/aempre/Fase%20G/03_recomendaciones_despliegue.md) — Manual de desarrollo (Go/Rust), indexación PostgreSQL/Redis, configuración de Helm y secrets.

### 🔄 [Fase H: Gestión de Cambios de la Arquitectura](file:///D:/aempre/Fase%20H/)
*   📄 [00_plan_fase_h.md](file:///D:/aempre/Fase%20H/00_plan_fase_h.md) — Plan de trabajo para mantenimiento y evolución.
*   📄 [01_proceso_gestion_cambios.md](file:///D:/aempre/Fase%20H/01_proceso_gestion_cambios.md) — Ciclo de vida RFC y taxonomía de cambios (Simplificación, Recreación, Redefinición).
*   📄 [02_evolucion_tecnologica.md](file:///D:/aempre/Fase%20H/02_evolucion_tecnologica.md) — Plan estratégico de adaptación ante Deepfakes de IA, Identidad Soberana (SSI) y 5G/6G Network Slicing.
*   📄 [03_monitoreo_capacidad.md](file:///D:/aempre/Fase%20H/03_monitoreo_capacidad.md) — KPIs de éxito, modelo de madurez CMMI de OSIPTEL y disparadores para reiniciar el ciclo ADM.

---
*Para mayor detalle sobre el seguimiento y progreso del proyecto, revisar el panel maestro en el [Estado del Proyecto](file:///D:/aempre/ESTADO_PROYECTO.md).*
