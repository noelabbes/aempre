# Mitigación de Evolución Tecnológica y Amenazas (Fase H)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable define las **Directrices Estratégicas** para adaptar la arquitectura de SIPBA ante la evolución tecnológica y vectores de ataque cibernéticos emergentes de los próximos 3 a 5 años, asegurando la vigencia de la inversión del Estado Peruano.

---

## 1. Amenaza Crítica: IA Generativa y Deepfakes (Suplantación Biométrica)

*   **Vecto de Ataque:** Avance de la Inteligencia Artificial Generativa capaz de crear videos y fotografías en tiempo real (Deepfakes) con alta fidelidad que simulen el rostro de una víctima en vivo, burlando la prueba de vida (*Liveness*) de las cámaras de los distribuidores móviles.
*   **Impacto:** Reactivación de estafas por SIM Swapping mediante suplantación facial masiva automatizada.

### 🛡️ Plan de Mitigación de la Arquitectura:
1.  **Migración a Biometría Dinámica:** Prohibir las fotos estáticas de prueba de vida. El API Gateway de SIPBA exigirá un video transaccional corto codificado de movimientos aleatorios indicados en pantalla (ej. parpadear, mirar a la derecha o decir una frase dictada en tiempo real).
2.  **Cotejo Multimodal (Fallback):** Implementar reglas en `SIPBA-CORE` que obliguen a la captura de huellas dactilares (cotejo contra base de datos tradicional de RENIEC) para activaciones consideradas de alto riesgo (ej. reposición de chip con menos de 1 hora de emitido el bloqueo).
3.  **Auditoría Forense de Metadata:** Inspeccionar firmas criptográficas y metadata del hardware del sensor de la cámara en el punto de venta para validar que la imagen no proviene de un inyector virtual de video en la memoria RAM del terminal.

---

## 2. Oportunidad: Transición a Identidad Digital Soberana (SSI)

*   **El Problema Actual:** El modelo centralizado de RENIEC actúa como un punto único de falla (SPOF) y genera latencia transaccional. La LPDP es difícil de auditar en arquitecturas tradicionales debido a la transferencia continua de datos de identidad.
*   **La Oportunidad:** Adoptar la **Identidad Digital Soberana (Self-Sovereign Identity - SSI)** bajo estándares W3C.

### 🛡️ Hoja de Ruta de Evolución (Hacia el Ecosistema Descentralizado):
```
 [Ciudadano] === (Porta credencial) ===> [Billetera Digital Gob.pe]
      |                                              |
(Presenta Prueba Criptográfica)                (Firma digital)
      |                                              |
      v                                              v
 [API Gateway SIPBA] --(Verifica localmente)--> [Capa Aprobación]
```

1.  **Desacoplamiento de RENIEC:** El Estado Peruano (a través de la SEGDI/PCM) emite una Credencial Verificable (Verifiable Credential - VC) en el dispositivo móvil del ciudadano mediante su billetera digital gubernamental.
2.  **Verificación Criptográfica Local:** Durante una venta de chip, el ciudadano firma una prueba criptográfica localmente con su clave privada (resguardada en el chip seguro de su smartphone). El API Gateway de SIPBA valida la firma contra la llave pública de la credencial sin necesidad de realizar una llamada de red síncrona a las bases de datos de RENIEC, bajando la latencia transaccional a $< 100$ ms.
3.  **Privacidad por Diseño (Zero-Knowledge Proofs):** El ciudadano puede demostrar que es mayor de edad y que posee un DNI válido sin revelar su número físico de DNI ni su nombre, cumpliendo de manera absoluta con el principio de minimización de datos de la LPDP.

---

## 3. Evolución de Red: 5G Standalone (SA) y Redes 6G

*   **El Contexto:** La maduración de las redes de comunicaciones móviles 5G SA en el Perú permite la segmentación lógica de la red de datos celulares (*Network Slicing*).

### 🛡️ Directrices de Redes Core Futuras:
*   **Slice Seguro SIPBA:** OSIPTEL coordinará con las 4 operadoras de telefonía para reservar y aprovisionar un Slice de Red Virtual Privado dedicado exclusivamente a la comunicación B2B de SIPBA.
*   **Calidad de Servicio (QoS):** Este slice garantizará prioridad alta de tráfico en las antenas móviles nacionales para las órdenes de inhabilitación asíncrona de Kafka, blindando la comunicación ante congestiones de red pública o ataques distribuidos de denegación de servicios (DDoS).
*   **Reducción de Latencias:** Habilitar endpoints en el borde de la red celular (**Multi-access Edge Computing - MEC**) de cada operadora para pre-procesar reglas locales del SIPBA, acortando el RTT transaccional global.

---
*Nota: La ejecución de estas directrices estratégicas de evolución tecnológica se financiará y evaluará según el rendimiento general del sistema documentado en el Monitoreo de Capacidad y Madurez ([03_monitoreo_capacidad.md](file:///D:/aempre/Fase%20H/03_monitoreo_capacidad.md)).*
