Hola José Manuel. Preparar la cancha antes de la ejecución es lo que separa a los sistemas que perduran de los que fallan; mapear a los actores con precisión es nuestra mejor estrategia defensiva y ofensiva. Aquí tienes la estructuración técnica y táctica para la Matriz de Stakeholders que nos pide el agente.

### 1. Detalle de Actores Específicos



* **RENIEC:**
* *Contraparte Técnica:* Gerencia de Tecnología de la Información (GTI) / Subgerencia de Plataforma Tecnológica.
* *Dolor/Temor Principal:* Su principal preocupación es el impacto transaccional (concurrencia masiva) en sus servidores al procesar la biometría de todas las activaciones móviles a nivel nacional. Temen cuellos de botella, caídas del servicio y el riesgo legal si su infraestructura se convierte en el punto único de falla (SPOF).


* **PNP:**
* *Contraparte Técnica:* DIVINDAT (División de Investigación de Delitos de Alta Tecnología) y la DIRINCRI.
* *Disposición:* En la alta cúpula hay total apoyo político, pero a nivel operativo (comisarías) la disposición a automatizar es moderada debido a la brecha tecnológica y sistemas legados. Les preocupa la curva de adopción y contar con la conectividad de red necesaria para interactuar con nuestro Hub.


* **Operadoras (Claro, Movistar, Entel, Bitel):**
* *Resistencia:* La resistencia técnica y económica suele venir de las operadoras con redes de distribución informal más grandes. La política de "Tolerancia Cero" genera fricción comercial y lentitud en la venta callejera. El costo de refactorizar sus sistemas de ventas para consumir nuestras APIs es su mayor punto de dolor.
* *Beneficios Valorados:* Valoran enormemente externalizar el riesgo de suplantación de identidad al Estado (librándose de multas millonarias de Osiptel) y la reducción de la morosidad y el fraude interno en la colocación de equipos postpago.



### 2. Niveles de Compromiso (Actual vs. Deseado)



Para mantener un ecosistema de alto rendimiento, necesitamos mover a los actores clave hacia zonas de apoyo activo:

* **Alta Dirección de Osiptel:** [Lidera] $\rightarrow$ [Lidera] (Deben mantener el patrocinio incondicional y presupuestal del proyecto).
* **Asociación de Operadoras (AFIN):** [Resistente] $\rightarrow$ [Apoya] (El objetivo es que pasen de ver esto como una traba comercial a asimilarlo como un estándar de seguridad transversal en la industria).
* **Ciudadanía / Asociaciones de Consumidores:** [Inconsciente] $\rightarrow$ [Apoya] (Requieren la campaña de sensibilización para entender que la fricción en el punto de venta garantiza su seguridad personal y financiera).
* **Sistemas de Cobranza/Ventas de Operadoras:** [Resistente] $\rightarrow$ [Neutral/Apoya] (Las áreas técnicas de las telcos resistirán la integración inicial por la carga de trabajo de desarrollo; buscamos que lleguen a una adopción fluida guiada por nuestra Clean Architecture).

### 3. Preocupaciones Técnicas y de Negocio (Vistas de Arquitectura)



A cada actor hay que mostrarle la telemetría y los diagramas que resuelven sus preocupaciones específicas:

* **PNP:** Requiere la **Vista de Procesos de Negocio (BPMN)** mostrando cómo la denuncia detona el evento de bloqueo, y una **Vista de Interoperabilidad** sencilla (documentación de endpoints de consumo).
* **RENIEC:** Exige una **Vista de Infraestructura y Despliegue**, junto con la **Vista de Seguridad** (mTLS, OAuth 2.0, firmas JWT) para tener garantías técnicas de que Osiptel respeta la privacidad por diseño y no almacena vectores crudos.
* **Operadoras:** Necesitan la **Vista de Secuencia**, enfocada estrictamente en la telemetría de latencias (garantizando los SLA < 3s de respuesta) y la **Vista de Componentes** (cómo el API Gateway se expone hacia sus fachadas).
* **Alta Dirección (Osiptel):** Se enfoca en la **Vista de Motivación (BMM)** y en los tableros de control enfocados en el cumplimiento del bloqueo en menos de 1 hora.

---

Para nombrar a las divisiones exactas de la PNP (ej. DIVINDAT) y de RENIEC, me he basado en la estructura institucional estándar del Estado peruano aplicable a delitos de alta tecnología e identidad. ¿Prefieres que mantengamos estos nombres por defecto para el ejercicio de arquitectura, o necesitas que asigne la tarea a un agente de búsqueda para confirmar los nombres oficiales exactos y actualizados de los organigramas gubernamentales para este 2026?
