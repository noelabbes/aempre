# Guion de Contenido para Presentación SIPBA (Diseñadores Canva)

Este documento contiene el contenido resumido para cada diapositiva de la presentación ejecutiva. 

**Nota para Diseñadores:** 
- El texto en **negrita** es sugerido para títulos o puntos clave.
- Las secciones marcadas como **[Punto Visual Sugerido]** indican elementos que podrían ser reemplazados por iconos, diagramas o infografías.
- Las secciones marcadas como **⚠️ ESTADO: EN DESARROLLO** indican que el contenido es preliminar y el diseño debe ser flexible para cambios futuros.

---

### Slide 01: Portada
*   **Título Principal:** Proyecto SIPBA: Sistema Inteligente de Protección Biométrica y Alerta.
*   **Subtítulo:** Modernización de la Arquitectura Empresarial para la Seguridad Ciudadana.
*   **Elementos:** Logotipo Osiptel, Nombres de Integrantes.

### Slide 02: Resumen Ejecutivo
*   **El Problema:** El SIM Swapping permite el robo de identidad y extorsión en minutos.
*   **La Solución:** SIPBA - Un **Hub Transaccional** que centraliza la identidad y acelera la respuesta ante el crimen.
*   **[Punto Visual Sugerido]:** Comparativa entre "Hoy (Vulnerable)" vs "Mañana (Seguro)".

### Slide 03: Fase Preliminar: Contexto y Drivers
*   **Marco Legal:** Decreto Legislativo 1738 (Refuerzo de controles de identidad).
*   **Impulsor Estratégico:** Plan Estratégico Institucional de Osiptel.
*   **Mandato:** Reducción de la brecha de seguridad en la venta de líneas móviles.

### Slide 04: Fase Preliminar: Organización y Herramientas
*   **Capacidad de AE:** Definición de roles críticos (Arquitecto de Integración, Oficial de Privacidad, Especialista IAM).
*   **Repositorio de Arquitectura:** Implementación en GitHub para trazabilidad y gobierno.
*   **Metamodelo:** Estándares para conectar Negocio, Datos y Tecnología.

### Slide 05: Fase Preliminar: Principios de Arquitectura
*   **Principios Rectores:**
    1. **Seguridad por Diseño:** La protección de datos es nativa.
    2. **Interoperabilidad:** Conexión fluida entre PNP, RENIEC y Operadoras.
    3. **Los datos son un Activo Compartido.**
*   **⚠️ ESTADO: EN DESARROLLO.** Los principios están definidos pero el documento formal está en proceso de redacción.

### Slide 06: Fase A (Visión): Modelo de Motivación (BMM)
*   **Influenciadores:** Crimen organizado, Latencia de 24h, Presión Ciudadana.
*   **Objetivos SMART:** 
    - Reducir el tiempo de bloqueo de **24h a <1h**.
    - **100%** de activaciones con biometría facial.
    - Reducción del **80%** del fraude por suplantación.

### Slide 07: Fase A (Visión): Situación Actual (AS-IS)
*   **Diagnóstico:** "La lentitud es aliada del crimen".
*   **Puntos de Dolor:** Procesamiento por lotes (Batch), silos de información, procesos manuales lentos.
*   **[Punto Visual Sugerido]:** Árbol de Problemas (Raíz: Latencia; Fruto: Extorsión).

### Slide 08: Fase A (Visión): Visión Objetivo (TO-BE)
*   **Concepto:** Osiptel como **Garante de Identidad**.
*   **Pilares:** 
    - Validación biométrica centralizada con RENIEC.
    - Orquestación de eventos en tiempo real.
    - Bloqueo inmediato disparado por denuncias PNP.

### Slide 09: Fase A (Visión): Stakeholders
*   **Mapa de Actores:** RENIEC (Identidad), PNP (Denuncias), Operadoras (Ejecución), Usuarios (Protección).
*   **⚠️ ESTADO: EN DESARROLLO.** Se requiere diseñar la Matriz de Poder e Interés definitiva.

### Slide 10: Fase B (Negocio): Entradas y Requerimientos
*   **Catálogo de Actores:** Definición de perfiles y responsabilidades dentro del SIPBA.
*   **⚠️ ESTADO: EN DESARROLLO.** El catálogo detallado de requerimientos de negocio está siendo priorizado.

### Slide 11: Fase B (Negocio): Modelado de Procesos
*   **Flujo TO-BE:** De la Identificación Biométrica al Bloqueo Automático.
*   **Interacción Clave:** Punto de Venta $\rightarrow$ SIPBA $\rightarrow$ RENIEC $\rightarrow$ Operadora.
*   **⚠️ ESTADO: EN DESARROLLO.** Los diagramas BPMN finales están en proceso de modelado.

### Slide 12: Fase B (Negocio): Arquitectura de Procesos
*   **Funciones del Servicio:** Registro de denuncias, validación de score biométrico, reglas de penalización.
*   **⚠️ ESTADO: EN DESARROLLO.** Se están definiendo las unidades organizativas de Osiptel que operarán el sistema.

### Slide 13: Fase B (Negocio): Análisis de Brechas (Gaps)
*   **Brecha de Negocio:** Transición de validaciones locales en operadoras a validación centralizada en Osiptel.
*   **Cambio:** De "Reporte Mensual" a "Auditoría en Tiempo Real".
*   **⚠️ ESTADO: EN DESARROLLO.** El cuadro comparativo formal de capacidades está pendiente.

### Slide 14: Hoja de Ruta (Roadmap)
*   **Fases del Proyecto:** 
    1. Cimentación (Preliminar).
    2. Visión y Diseño (Fase A/B).
    3. Piloto de Integración PNP.
    4. Despliegue Nacional.
*   **⚠️ ESTADO: EN DESARROLLO.** El cronograma detallado con hitos específicos está en construcción.

### Slide 15: Conclusiones y Valor de Negocio
*   **Impacto Social:** Restablecimiento de la confianza en el ecosistema digital.
*   **Eficiencia:** Eliminación del 100% de la latencia humana en el bloqueo de líneas.
*   **Mensaje Final:** "SIPBA: Protegiendo la identidad de cada peruano en tiempo real".
