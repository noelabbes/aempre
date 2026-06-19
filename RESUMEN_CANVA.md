# Guía de Presentación Ejecutiva y Prompts: Proyecto SIPBA - OSIPTEL
## Estructura de Slides y Guion Conversacional (Fase Preliminar $\rightarrow$ Fase B)

Este documento contiene la estructura de diapositivas diseñada para alimentar a generadores de diapositivas y video por IA (como *Nano Banana Pro* o *Gamma*), estructurada con **Prompts de Diseño Visual** y **Guiones de Narrativa (estilo conversación fluida de NotebookLM)**.

---

### 🎴 Diapositiva 01: Portada y Presentación
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Minimalista y de alto impacto corporativo. Fondo oscuro (azul noche profundo `#0B132B`). Logotipo de OSIPTEL centrado en la parte superior. Al centro, tipografía sans-serif moderna de gran tamaño en color blanco y acentos en verde cian brillante (`#48CAE4`). 
    > **Elementos:** Un sutil holograma o red de conexiones interconectadas en el fondo.
    > **Texto Principal:** "Proyecto SIPBA: Sistema de Identidad Personal y Bloqueo Automático"
    > **Subtítulo:** "Arquitectura Empresarial contra el SIM Swapping y la Extorsión en el Perú"
*   **Contenido en Diapositiva:**
    *   OSIPTEL – Organismo Supervisor de Inversión Privada en Telecomunicaciones
    *   Arquitectura de Transformación Sectorial
    *   Fase Preliminar a Fase B (Metodología TOGAF 9.2 ADM)
*   **Guion de Audio (Estilo NotebookLM):**
    > *"¡Hola a todos! Hoy queremos presentarles el Proyecto SIPBA, una iniciativa estratégica diseñada por OSIPTEL. No estamos hablando solo de un software, sino de una redefinición completa de la Arquitectura Empresarial del sector telecomunicaciones para enfrentar dos de los delitos que más golpean la seguridad ciudadana: el SIM Swapping y la extorsión móvil. Vamos a recorrer cómo estructuramos esta transformación desde las bases de gobernanza hasta los procesos del negocio."*

---

### 🎴 Diapositiva 02: Resumen Ejecutivo
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Pantalla dividida en dos columnas simétricas para mostrar un contraste claro de "Problema vs. Solución". Estilo infografía limpia.
    > **Izquierda (Rojo Suave `#E63946`):** Icono de teléfono vulnerado con candado abierto.
    > **Derecha (Verde Menta `#2A9D8F`):** Icono de Hub/API Gateway blindado con escudo.
*   **Contenido en Diapositiva:**
    *   **El Problema:** SIM Swapping en aumento, suplantación en puntos de venta ambulatorios y latencias de bloqueo de hasta 24 horas.
    *   **La Solución:** SIPBA como Hub Transaccional en tiempo real que valida identidad contra RENIEC y automatiza el bloqueo con la PNP.
*   **Guion de Audio (Estilo NotebookLM):**
    > *"Para entender la urgencia: el crimen organizado se aprovecha de que hoy las operadoras validan la identidad de forma aislada y de que los bloqueos de líneas toman hasta 24 horas. Con SIPBA, OSIPTEL asume un rol activo: transformamos el modelo pasivo en un Hub Transaccional en tiempo real. Si hay una denuncia, el bloqueo ocurre en minutos. Si se activa un chip, la biometría se valida en segundos."*

---

### 🎴 Diapositiva 03: Fase Preliminar - Contexto y Drivers Estratégicos
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Línea de tiempo horizontal o flujo de tres bloques en cascada. Colores sobrios y profesionales. 
    > **Elementos:** Icono de balanza de justicia (Marco Legal), icono de gráfico con caída estadística (Inconsistencias) e icono de escudo (Criminalidad).
*   **Contenido en Diapositiva:**
    *   **Driver 1: DL 1738** - Obligación legal de reforzar controles de identidad móvil.
    *   **Driver 2: Inestabilidad Política** - Amenazas a la autonomía institucional y rotación directiva.
    *   **Driver 3: Datos de Mercado** - Inconsistencias estadísticas y discrepancias en reportes de conexiones fijas/móviles.
*   **Guion de Audio (Estilo NotebookLM):**
    > *"Empecemos por las reglas de juego. En la Fase Preliminar respondimos a la pregunta '¿cómo haremos la arquitectura?'. Los impulsores son claros: el Decreto Legislativo 1738 que exige candados biométricos, las tensiones políticas que amenazan la autonomía de OSIPTEL y la necesidad de erradicar inconsistencias estadísticas en los datos de conexiones que se reportan al mercado."*

---

### 🎴 Diapositiva 04: Fase Preliminar - Capacidad de AE y Metamodelo
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Diagrama simplificado de caja organizativa con 3 niveles circulares concéntricos (Core, Soft, Extendido) a la izquierda, y un pequeño gráfico del metamodelo simplificado a la derecha.
    > **Colores:** Gradientes de azul a verde azulado.
*   **Contenido en Diapositiva:**
    *   **Alcance Organizacional:** GTIC (TI), GFS (Fiscalización), GU (Usuarios), RENIEC y PNP.
    *   **Roles Clave:** Arquitecto de APIs, Oficial de Privacidad y Analista de Datos de Linaje.
    *   **Metamodelo:** Conexión de Drivers Estratégicos con Procesos, Datos perimetrales y Aplicaciones.
*   **Guion de Audio (Estilo NotebookLM):**
    > *"Para sostener este proyecto, no podíamos ver solo la tecnología. Definimos una capacidad de arquitectura que integra el núcleo de OSIPTEL (TI y Fiscalización) con la PNP y RENIEC. Además, creamos un metamodelo estratégico. ¿Por qué? Para que cada decisión técnica, como evaluar una regla de negocio o trazar un dato, esté justificada por un driver del negocio o una exigencia legal."*

---

### 🎴 Diapositiva 05: Fase Preliminar - Los 9 Principios de Arquitectura
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Cuadrícula de 3x3 tarjetas limpias. Cada tarjeta representa un principio con un título en negrita y un icono representativo pequeño y de color contrastante.
    > **Elementos Destacados:** Destacar con bordes brillantes los principios institucionales de Autonomía y Transparencia.
*   **Contenido en Diapositiva:**
    *   **Seguridad sobre Agilidad** (Tolerancia Cero).
    *   **Privacidad por Diseño** (No almacenamiento de fotos crudas).
    *   **Autonomía Tecnológica** (Resiliencia ante inestabilidad política).
    *   **Transparencia del Dato** (Linaje y auditoría estadística).
    *   *Otros:* Interoperabilidad, Cooperación, Eficiencia, Fiscalización por Riesgos y Enfoque en Reclamos.
*   **Guion de Audio (Estilo NotebookLM):**
    > *"Aquí están los cimientos: establecimos 9 principios innegociables. Dos son vitales para OSIPTEL: la Autonomía Tecnológica, para garantizar que las reglas técnicas operen independientemente de los cambios políticos, y la Transparencia del Dato, asegurando que cada cifra reportada al mercado tenga un linaje auditable e indiscutible."*

---

### 🎴 Diapositiva 06: Fase A (Visión) - Motivación de Negocio (BMM)
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Tres columnas verticales limpias representando "Metas", "Objetivos SMART" y "Directivas". Estilo de texto grande y limpio.
    > **Colores:** Fondo azul oscuro con tarjetas grises muy claras (`#F8F9FA`) y texto oscuro.
*   **Contenido en Diapositiva:**
    *   **Metas:** Erradicar el anonimato móvil y restablecer la confianza en el sector.
    *   **Objetivos SMART:** SLA de bloqueo < 1h; 100% de activaciones críticas con biometría facial; 80% de reducción de SIM Swapping.
    *   **Reglas de Negocio:** Límite preventivo de 7 líneas por titular y regla de 3 strikes a distribuidores.
*   **Guion de Audio (Estilo NotebookLM):**
    > *"En la Fase A construimos la Visión de la Arquitectura. Mediante el Modelo de Motivación de Negocio, definimos objetivos agresivos pero medibles: queremos reducir el tiempo de bloqueo a menos de una hora y erradicar el anonimato. Para lograrlo, implementamos reglas estrictas controladas por el regulador, como impedir que un titular registre más de 7 líneas móviles."*

---

### 🎴 Diapositiva 07: Fase A (Visión) - Concepto de Solución TO-BE
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Diagrama arquitectónico simplificado de alto nivel de 3 bloques interconectados.
    > **Bloque 1 (Izquierda):** PNP (Denuncias de Extorsión).
    > **Bloque 2 (Centro):** SIPBA Hub OSIPTEL (API Gateway + Motor de Reglas).
    > **Bloque 3 (Derecha):** Operadoras (HLR/Bloqueo) y RENIEC (Cotejo Biométrico).
    > **Flujos:** Flechas animadas síncronas y asíncronas.
*   **Contenido en Diapositiva:**
    *   **Hub Transaccional Centralizado:** OSIPTEL como puente federado de confianza.
    *   **Canal Seguro (PIDE):** Consumo seguro mTLS con RENIEC y la PNP.
    *   **Orquestación de Bloqueo:** Automatización de suspensión de SIMs en menos de 1 hora.
*   **Guion de Audio (Estilo NotebookLM):**
    > *"El concepto de solución es potente. OSIPTEL se convierte en un Hub Transaccional central. Cuando el ciudadano denuncia en la PNP, esta gatilla un evento automático firmado digitalmente hacia el SIPBA. El Hub procesa la regla y le ordena la suspensión inmediata a las operadoras a través de webhooks asíncronos. Todo automático, sin burocracia ni llamadas manuales."*

---

### 🎴 Diapositiva 08: Fase A (Visión) - Mapa de Stakeholders
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Matriz de 2x2 representando Poder (Eje Y) vs. Interés (Eje X).
    > **Cuadrante Superior Derecho (Gestionar de cerca):** RENIEC GTI y Alta Dirección OSIPTEL.
    > **Cuadrante Superior Izquierdo (Mantener satisfechos):** Operadoras (AFIN).
    > **Cuadrante Inferior Derecho (Mantener informados):** PNP (DIVINDAT) y Ciudadanía.
*   **Contenido en Diapositiva:**
    *   **RENIEC (GTI):** Socio clave (Preocupación: Latencia y picos de transacciones).
    *   **PNP (DIVINDAT):** Adopción operativa en comisarías (Preocupación: Evidencia legal).
    *   **Operadoras (AFIN):** Mitigar fricción en canales de venta y costo de integración.
*   **Guion de Audio (Estilo NotebookLM):**
    > *"Un factor crítico en la Fase A es el Mapa de Stakeholders. RENIEC es nuestro socio estratégico: debemos garantizar que sus respuestas biométricas tarden menos de 3 segundos. Las operadoras privadas al inicio muestran resistencia por costos, pero les demostramos que reducir el fraude les ahorrará millones en multas y litigios."*

---

### 🎴 Diapositiva 09: Fase B (Negocio) - Procesos TO-BE (Activación)
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Diagrama de flujo horizontal o de natación (Swimlanes) con 4 carriles: Ciudadano $\rightarrow$ Operadora $\rightarrow$ Hub SIPBA $\rightarrow$ RENIEC.
    Tipografía limpia, transiciones suaves de color.
*   **Contenido en Diapositiva:**
    1.  **Solicitud:** El cliente pide chip y se captura rostro con control de prueba de vida (*Liveness*).
    2.  **Evaluación:** SIPBA valida reglas perimetrales (límite de líneas y blacklist de distribuidor).
    3.  **Cotejo:** Consulta 1:1 contra RENIEC mediante firma segura.
    4.  **Activación:** Emisión de firma JWT de aprobación y habilitación técnica de red.
*   **Guion de Audio (Estilo NotebookLM):**
    > *"Pasando a la Arquitectura de Negocio en la Fase B, modelamos los procesos clave. El primero es la Activación. Ahora, cuando solicitas un chip, el vendedor debe capturar tu rostro con prueba de vida en el app. Esa solicitud viaja al Hub de OSIPTEL, se validan los límites y se cruza con RENIEC. Si todo coincide, el Hub emite un token de aprobación para habilitar la línea."*

---

### 🎴 Diapositiva 10: Fase B (Negocio) - Procesos TO-BE (Bloqueo y Sanción)
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Dos bloques paralelos representando "Proceso de Bloqueo Inmediato" y "Proceso de Sanción (3 Strikes)".
    > **Visual:** Animación de un candado cerrándose rápidamente (Bloqueo) y una tarjeta roja levantándose (Sanción).
*   **Contenido en Diapositiva:**
    *   **Bloqueo por Denuncia PNP:** Evento en tiempo real $\rightarrow$ Ingesta en SIPBA $\rightarrow$ Cola de mensajería asíncrona $\rightarrow$ Suspensión técnica en HLR (< 1h).
    *   **Regla de 3 Strikes:** Registro de fraudes por distribuidor $\rightarrow$ Alertas en Strikes 1 y 2 $\rightarrow$ Revocación inmediata del token OAuth en Strike 3.
*   **Guion de Audio (Estilo NotebookLM):**
    > *"Los otros dos procesos son de seguridad. El Bloqueo Inmediato automatiza la comunicación: la PNP reporta la extorsión y SIPBA inactiva el chip directamente en el core de red de la operadora. Por otro lado, la regla de 3 strikes fiscaliza a la cadena comercial: si un distribuidor comete 3 fraudes de suplantación, el sistema revoca automáticamente sus credenciales B2B en el API Gateway."*

---

### 🎴 Diapositiva 11: Fase B (Negocio) - Catálogo de Requerimientos
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Tabla organizada o lista jerárquica con tarjetas de clasificación ("Funcionales" vs. "No Funcionales").
    > **Colores:** Iconos y bordes amarillos para requerimientos prioritarios de SLA y seguridad.
*   **Contenido en Diapositiva:**
    *   **Requerimientos Funcionales:** Biometría obligatoria, control de 7 líneas por DNI, webhook de bloqueo masivo y reconciliación de linaje de datos.
    *   **Requerimientos No Funcionales:** Privacidad por Diseño (Cifrado de vectores, sin almacenamiento de fotos crudas), Latencia < 3s y Alta Disponibilidad del Gateway (99.99%).
*   **Guion de Audio (Estilo NotebookLM):**
    > *"El Catálogo de Requerimientos de la Fase B es lo que le da viabilidad al sistema. Definimos requerimientos funcionales críticos, como el webhook de bloqueo y el linaje de datos. Pero igual de importantes son los no funcionales: garantizar la privacidad del ciudadano protegiendo sus datos biométricos y asegurar una latencia perimetral menor a 3 segundos."*

---

### 🎴 Diapositiva 12: Fase B (Negocio) - Gap Analysis (Análisis de Brechas)
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Cuadrícula comparativa con columnas: "Capacidad", "AS-IS", "TO-BE" y "Brecha (Acción)".
    > **Visual:** Fila de Gobernanza en naranja, Fila de Bloqueo en verde, Fila de Distribuidores en azul.
*   **Contenido en Diapositiva:**
    *   **Gobernanza:** De controles laxos en operadoras $\rightarrow$ Centralizado en Hub OSIPTEL (Cierre: Motor de reglas).
    *   **Bloqueo:** De latencia batch de 24h $\rightarrow$ Tiempo real asíncrono (Cierre: Integración de APIs).
    *   **Canal:** De fiscalización reactiva manual $\rightarrow$ Autoclausura virtual automática por Strikes (Cierre: OAuth + Risk Scoring).
*   **Guion de Audio (Estilo NotebookLM):**
    > *"El Gap Analysis es el corazón del diagnóstico de la Fase B. Nos muestra exactamente qué debe cambiar. Dejamos atrás las auditorías manuales y reactivas en campo y las reemplazamos por una autoclausura virtual e inmediata de distribuidores fraudulentos en el API Gateway, y pasamos de procesamientos nocturnos batch a eventos en tiempo real."*

---

### 🎴 Diapositiva 13: Roadmap e Impacto de Negocio
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Cronograma en fases horizontales o diagrama de barras de progreso. 
    > **Visual:** Fase Preliminar (Completada), Fase A (Completada), Fase B (Completada), Fase C (Próxima).
*   **Contenido en Diapositiva:**
    *   **Fase Preliminar & A & B:** Cerradas (Gobernanza, Visión, Procesos y Gaps establecidos).
    *   **Impacto GFS:** Transición a fiscalización inteligente basada en riesgos.
    *   **Impacto GTIC:** Gestión de plataformas críticas y APIs perimetrales.
*   **Guion de Audio (Estilo NotebookLM):**
    > *"Para concluir: la Arquitectura Empresarial de SIPBA está lista en su estrategia y negocio. Hemos cerrado las fases Preliminar, A y B al 100%. Las áreas de OSIPTEL ya tienen claros sus impactos: Fiscalización migrará a un modelo basado en riesgos y TI se convertirá en el operador de un Hub perimetral transaccional del Estado. El camino está trazado."*

---

### 🎴 Diapositiva 14: Conclusiones y Valor Agregado
*   **Prompt de Entrada (IA Visual - Nano Banana Pro):**
    > **Layout:** Diapositiva limpia con tipografía muy grande para las métricas de valor.
    > **Visual:** Tres tarjetas de color sólido destacado con números grandes en blanco.
*   **Contenido en Diapositiva:**
    *   **80%** de reducción proyectada en fraude por SIM Swapping.
    *   **1 hora** de SLA de bloqueo de chips reportados por extorsión.
    *   **100%** de alineación con la Ley de Protección de Datos Personales.
*   **Guion de Audio (Estilo NotebookLM):**
    > *"El valor del proyecto SIPBA se resume en tres números: proyectamos reducir en un 80% el SIM Swapping en los primeros 6 meses, garantizamos inhabilitar chips extorsivos en menos de una hora, y todo esto protegiendo al 100% los datos personales de los ciudadanos. Muchas gracias."*

