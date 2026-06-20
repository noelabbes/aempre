  Para evitar que el profesor perciba el proyecto como "solo un aplicativo intermediario o un reordenamiento de
  procesos", debemos elevar la narrativa hacia una transformación de capacidades de la Arquitectura Empresarial
  (AE), alineada con los desafíos reales de OSIPTEL y las recomendaciones de la OCDE (2023).

  Aquí te presento cómo conectar el SIPBA con los problemas sistémicos de desafíos_actuales_osiptel.md y qué preguntas estratégicas debemos plantear para robustecer transversalmente el proyecto.
  ──────
  ## 1. El Argumento de AE: ¿Por qué SIPBA no es solo un aplicativo?

  Bajo la perspectiva de Arquitectura Empresarial, el SIPBA es el habilitador tecnológico que transforma los
  procesos del regulador. Debes defender los siguientes puntos ante tu profesor:

  ### A. De "Fiscalización Reactiva" a "Fiscalización Basada en Riesgos" (OCDE PAFER)

  • El problema: OSIPTEL tiene recursos limitados y no puede supervisar físicamente miles de puntos de venta en
  todo el Perú.
  • El enfoque de AE: SIPBA redefine la Capacidad de Supervisión (Fase B). La fiscalización ya no es física y
  aleatoria (reactiva); ahora es una fiscalización basada en riesgos y automatizada. El motor de reglas ( SIPBA-
  CORE ) y la analítica ex-post ( SIPBA-ETL ) detectan anomalías y aplican sanciones inmediatas (ej. inhabilitar
  tokens en Redis mediante la regla de "3 Strikes") sin intervención humana discrecional. Esto responde
  directamente al marco regulatorio PAFER de la OCDE.

  ### B. Intercepción del Flujo de Valor de Reclamos (Eficiencia Operativa)

  • El problema: OSIPTEL colapsa bajo una carga de 1.25 millones de reclamos anuales, la mayoría vinculados a
  fraudes o suplantaciones en telefonía móvil.
  • El enfoque de AE: En lugar de diseñar un software para "gestionar mejor los reclamos", la arquitectura del
  SIPBA elimina la causa raíz en la fuente. Al evitar el fraude en el momento de la venta mediante validación
  federada en tiempo real (mTLS + RENIEC), el flujo de valor de atención a reclamos en la Gerencia de Usuarios
  (GU) se descongestiona, liberando presupuesto y personal (OpEx) hacia tareas de mayor valor.

  ### C. Restablecimiento de la Credibilidad y Transparencia de Datos

  • El problema: Críticas recientes (junio 2026) señalan inconsistencias y discrepancias en las estadísticas de
  líneas activas reportadas por las operadoras.
  • El enfoque de AE: La Arquitectura de Datos (Fase C) y el pipeline Spark de Reconciliación Diaria (Fase D)
  actúan como la única fuente de verdad (Single Source of Truth). La base analítica consolidada y auditada de
  OSIPTEL erradica las distorsiones estadísticas del mercado, devolviendo la credibilidad e institucionalidad al
  regulador ante inversionistas.

  ### D. Blindaje de la Autonomía Regulatoria mediante Criptografía

  • El problema: Presiones políticas y lobby de operadoras móviles que intentan frenar los bloqueos de celulares o
  limitar controles.
  • El enfoque de AE: Al codificar las políticas regulatorias en un sistema transaccional inmutable firmado con
  llaves HSM a nivel de plataforma (Fase D), las decisiones del regulador se vuelven técnicas, automatizadas y no
  discrecionales. Se protege al personal técnico de interferencias políticas.
  ──────
  ## 2. Preguntas Clave para Robustecer el Proyecto Transversalmente

  Para enriquecer los entregables del repositorio, podemos plantearnos (y consultar en futuras iteraciones) las
  siguientes preguntas de Arquitectura Empresarial:

  1. Gobernanza del Estado (Interoperabilidad):
      • Pregunta: ¿Cómo se inserta SIPBA dentro del catálogo de servicios de la Plataforma de Interoperabilidad
      del Estado Peruano (PIDE) de la PCM-SEGDI?
      • Objetivo: Demostrar que el regulador no actúa de forma aislada, sino que su API Gateway se integra bajo el
      metamodelo de gobierno digital nacional.
  2. Rediseño Organizacional (RACI y Capacidad Humana):
      • Pregunta: Al automatizarse la fiscalización en los canales de venta, ¿cómo se reestructuran los perfiles
      de la Gerencia de Supervisión y Fiscalización (GFS)?
      • Objetivo: Detallar en la Fase B y F la transición de fiscalizadores de campo tradicionales a analistas
      forenses de datos (Data Forensic Analysts) que auditan alertas en tiempo real.
  3. Algoritmo de Riesgo del Distribuidor (Strike System):
      • Pregunta: ¿Qué variables componen cuantitativamente el "score de riesgo" del distribuidor comercial en el
      pipeline analítico?
      • Objetivo: Robustecer el diseño de datos agregando variables como: geolocalización en zonas calientes de
      crimen, volumen atípico de transacciones por hora y porcentaje de fallos biométricos previos.
  4. Modelo Financiero y Retorno de Inversión (ROI):
      • Pregunta: ¿Cómo impacta la reducción del 80% del fraude por suplantación en el presupuesto operativo de
      OSIPTEL a largo plazo?
      • Objetivo: Justificar la inversión del CapEx (\$485K) y OpEx (\$32K/mes) calculando el ahorro en horas de
      personal legal y administrativo que hoy procesa quejas fraudulentas.

  ──────
