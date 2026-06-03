
# Sobre el proyecto
El proyecto para Osiptel se enfoca en diseñar una Arquitectura Empresarial (AE) orientada a combatir la extorsión digital y el fraude por suplantación de identidad, conocido como SIM Swapping.

**Temas tocados a lo largo del diseño:**

* **Evaluación del escenario actual (AS-IS):** Se analizaron debilidades críticas como la normativa reactiva (donde los bloqueos tardan hasta 24 horas), la vulnerabilidad ante la venta ambulatoria, la corrupción en distribuidores y la falta de visibilidad en tiempo real de las activaciones.


* **Modelo de Motivación de Negocio (BMM):** Se estructuró el contexto identificando los influenciadores externos (el crimen organizado, la presión ciudadana, y normativas como el DL 1738) y los internos (el rol legal de Osiptel y la capacidad del RENTESEG) que obligan a tomar acción.


* **Dominios de Arquitectura:** Se planteó el trabajo sobre las capas de Negocio, Información, Aplicaciones y Tecnología, incluyendo la identificación de los modelos actuales y futuros, además del análisis de brechas (Gap Analysis).


* **Políticas y Reglas de Negocio:** Se establecieron directivas que se programarán en la nueva arquitectura, tales como la tolerancia cero para activaciones sin prueba de vida (Liveness Detection), la denegación automática al superar las 7 líneas a nombre de un mismo titular, y la pérdida automática del código de venta para distribuidores con 3 incidentes de líneas extorsivas.



**¿Qué es lo que se quiere hacer? (Fines y Estrategia)**

* **Visión:** Convertir a Osiptel en el garante de un ecosistema digital seguro en donde la identidad móvil sea inalterable, erradicando así el anonimato.


* **Objetivos Específicos:** Reducir el tiempo de respuesta (SLA) para el bloqueo de líneas de 24 horas a menos de 1 hora. Además, lograr que el 100% de las activaciones críticas estén respaldadas por biometría facial en un plazo máximo de 12 meses.


* **Estrategia de Solución (Modelo TO-BE):** Transformar a Osiptel en un Hub Transaccional en tiempo real a través del Proyecto SIPBA. Tácticamente, esto implica construir un API Gateway que funcione como intermediario entre las operadoras de telefonía y el RENIEC, y establecer una integración directa del sistema RENTESEG con el sistema de denuncias de la PNP.
