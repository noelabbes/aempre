# Monitoreo de Capacidad y Madurez de la Arquitectura (Fase H)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable establece las métricas de monitoreo continuo para evaluar el valor real aportado por la arquitectura SIPBA y define el **Modelo de Madurez de Arquitectura** para asegurar la mejora continua y el ciclo de vida del regulador.

---

## 1. KPIs de Valor y Desempeño de la Arquitectura

Para verificar que el sistema SIPBA cumple con los objetivos de negocio estratégicos de OSIPTEL y la seguridad nacional, el Comité de Gobernanza supervisará mensualmente los siguientes indicadores clave:

### 1.1. KPIs de Impacto de Negocio (Seguridad Ciudadana)
*   **Tasa de Reducción de Fraude por Suplantación (SIM Swapping):**
    *   *Objetivo:* Reducción $\ge 80\%$ en las denuncias y reclamos registrados por suplantación de identidad en un plazo de 12 meses tras el Go-Live de la AT2.
*   **Efectividad del SLA de Bloqueo Inmediato:**
    *   *Objetivo:* $\ge 99\%$ de las órdenes de bloqueo PNP deben completarse en HLR/EIR en menos de 15 minutos.

### 1.2. KPIs de Conformidad Técnica (Plataforma)
*   **Conformidad Biométrica con Liveness:**
    *   *Objetivo:* $100\%$ de las transacciones comerciales críticas deben completarse utilizando verificación facial con detección de prueba de vida activa.
*   **Tasa de Discrepancia Reconciliada (ETL):**
    *   *Objetivo:* $< 0.1\%$ de discrepancias diarias no justificadas entre el log comercial de las operadoras y el catálogo transaccional de SIPBA.

---

## 2. Auditoría Anual de Madurez de Arquitectura Enterprise

OSIPTEL evaluará la madurez de su capacidad de Arquitectura Empresarial utilizando el modelo simplificado de madurez **CMMI** adaptado a TOGAF:

```
[Nivel 1: Inicial] -> [Nivel 2: Repetible] -> [Nivel 3: Definido] -> [Nivel 4: Gestionado] -> [Nivel 5: Optimizado]
```

### Plan de Maduración (Metas 2026-2028):
*   **Nivel Actual (AS-IS): Nivel 2 (Repetible).** La arquitectura se ejecuta por proyectos aislados y depende de la pericia de especialistas individuales.
*   **Meta Año 1 (Fases Preliminar a F): Nivel 3 (Definido).** Procesos de arquitectura estandarizados e integrados en la gobernanza de TI institucional de OSIPTEL.
*   **Meta Año 2 (Fase G y H operativas): Nivel 4 (Gestionado).** Monitoreo cuantitativo del rendimiento de la arquitectura mediante KPIs de valor de negocio y revisiones automáticas de cumplimiento de APIs.

---

## 3. Disparadores para el Reinicio del Ciclo ADM de TOGAF

La arquitectura empresarial no es un plano estático. El regulador iniciará una nueva **Fase Preliminar y Fase A (Visión)** para redefinir o rediseñar el SIPBA ante los siguientes disparadores (*Architecture Triggers*):

### 3.1. Disparadores Legales y Regulatorios
*   Modificaciones en el Decreto Legislativo 1738 (Ley de RENTESEG) que cambien la competencia de OSIPTEL, o la aprobación de un nuevo reglamento nacional de protección de datos personales que limite la interoperabilidad estatal B2B.

### 3.2. Disparadores por Brechas de Seguridad (Ciberseguridad)
*   Vulneración de los algoritmos de encriptación del HSM core del regulador, filtración masiva confirmada de datos biométricos federados en los servidores de RENIEC, o la aparición de técnicas de evasión de deepfakes indetectables para los sistemas de liveness instalados.

### 3.3. Disparadores Tecnológicos (Obsolescencia)
*   Decomiso y apagón a nivel nacional de las redes móviles 4G (LTE), obligando a redefinir el aprovisionamiento y mensajería del core exclusivamente bajo canales de Network Slicing en redes 5G Standalone y futuras 6G.

### 3.4. Disparadores de Cooperación Internacional
*   Acuerdos bilaterales o regionales (ej. Comunidad Andina de Naciones - CAN) para integrar el SIPBA de OSIPTEL con los registros de bases de datos de IMEIs robados de países vecinos para combatir el tráfico transfronterizo de terminales móviles.

---
*Nota: La formalización de estos disparadores e indicadores cierra el ciclo continuo del ADM de TOGAF. Este repositorio de arquitectura queda consolidado y listo para ser transferido al equipo ejecutor y al Comité de Gobernanza del SIPBA.*
