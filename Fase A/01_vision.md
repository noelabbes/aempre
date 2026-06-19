# Visión de Arquitectura (Architecture Vision)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este documento describe la transformación estratégica de OSIPTEL desde el estado actual (vulnerable y fragmentado) hacia un ecosistema de identidad móvil nacional seguro, transparente y altamente interoperable.

---

## 1. Escenario Actual (AS-IS): Alta Latencia y Fragmentación

La arquitectura actual de fiscalización e identidad móvil presenta debilidades críticas que son explotadas por el crimen organizado para realizar SIM Swapping y extorsión:

*   **Puntos de Falla en Bloqueo (Latencia de 24h a 48h):**
    *   **Asincronía Humana:** Las denuncias por suplantación dependen de canales manuales (comisarías, call centers de operadores), retrasando el flujo técnico de alerta.
    *   **Procesamiento por Lotes (Batch):** La comunicación de bloqueos entre el RENTESEG de OSIPTEL y las operadoras móviles se realiza en ventanas nocturnas diferidas, dejando una ventana de vulnerabilidad amplia para cometer delitos.
    *   **Silos de Información:** Inexistencia de interfaces en tiempo real para coordinar de forma cruzada entre OSIPTEL, la PNP y las bases de datos de operadores.
*   **Venta Ambulatoria y Debilidad en Canales Directos:**
    *   Validaciones biométricas locales en las operadoras con controles laxos. Ausencia obligatoria de algoritmos avanzados de prueba de vida (*Liveness Detection*) en puntos de venta ambulatorios y de distribuidores de alto riesgo.
*   **Inconsistencias Estadísticas y Pérdida de Credibilidad:**
    *   Falta de un linaje de datos auditable sobre las variaciones y bajas de conexiones móviles, lo que provoca discrepancias numéricas en los reportes públicos de cara al mercado e inversionistas.

---

## 2. Escenario Objetivo (TO-BE): SIPBA como Hub Transaccional

El Proyecto SIPBA posiciona a OSIPTEL como el **orquestador central y garante de identidad** del ecosistema digital de telecomunicaciones en el Perú. 

*   **Bloqueo Inmediato (SLA < 1 hora):** Integración directa basada en eventos entre el sistema de denuncias virtuales de la PNP (DIVINDAT) y el SIPBA. Al recibirse una alerta, el sistema emite de manera síncrona instrucciones automáticas de inhabilitación hacia todas las operadoras de telefonía.
*   **Activación Crítica con Control Centralizado:**
    *   Toda alta nueva o reposición de chip debe ser validada en tiempo real contra el SIPBA.
    *   El Hub interactúa mediante mTLS y la Plataforma de Interoperabilidad del Estado (PIDE) con la base central biométrica de RENIEC para un cotejo 1:1 riguroso.
*   **Gobernanza de Reglas de Negocio Desacoplada:**
    *   Las reglas críticas (ej. rechazo automático al superar 7 líneas, revocación de tokens a distribuidores con 3 incidentes) son gobernadas por el motor de reglas de OSIPTEL, eliminando la dependencia de la autoevaluación del operador privado.
*   **Linaje y Auditoría Completa de Datos:**
    *   Cada transacción genera metadatos de auditoría inalterables (tokens y firmas JWT), garantizando el no repudio y permitiendo rastrear el origen de cualquier conexión reportada.

---

## 3. Diagrama de Concepto de Solución (Solution Concept Diagram)

El siguiente diagrama ilustra la interacción lógica de componentes bajo el modelo de arquitectura SIPBA TO-BE:

```mermaid
graph TD
    subgraph "Entidades Públicas Externas (Interconexión PIDE)"
        PNP["PNP (DIVINDAT) <br> Denuncias de Extorsión"]
        RENIEC["RENIEC (GTI) <br> Base de Identidad Nacional"]
    end

    subgraph "OSIPTEL (Núcleo Transaccional SIPBA)"
        GW["API Gateway Perimetral <br> (mTLS / OAuth 2.0 / JWT)"]
        Core["Motor Transaccional SIPBA <br> (Orquestador de Reglas)"]
        DB_Rent["BD RENTESEG <br> (Metadata, Auditoría y Trazabilidad)"]
        Risk["Analítica de Riesgo <br> (Fiscalización y Score de Distribuidor)"]
    end

    subgraph "Operadoras Móviles (Claro, Movistar, Entel, Bitel)"
        OP_Claro["Adaptador Operadora <br> (Core de Red)"]
        PV["Canales y Puntos de Venta <br> (Biometría Facial + Liveness)"]
    end

    %% Flujos de Activación Biométrica
    PV -->|1. Captura de Rostro & DNI| OP_Claro
    OP_Claro -->|2. Validación (Token + Hash Minucias)| GW
    GW -->|3. Inspección Perimetral| Core
    Core -->|4. Evaluación de Reglas (Límite 7 Líneas)| Core
    Core -->|5. Cotejo Biométrico 1:1| RENIEC
    RENIEC -->>|6. Confirmación (Score de Similitud)| Core
    Core -->>|7. Autorización / Denegación| OP_Claro
    Core -->|8. Registro Metadatos (Sin foto cruda)| DB_Rent

    %% Flujos de Bloqueo Inmediato
    PNP -->|1. Registro de Denuncia Real-Time| Core
    Core -->|2. Propaga Evento de Bloqueo| GW
    GW -->|3. Webhook de Inhabilitación Técnica| OP_Claro
    OP_Claro -->|4. Bloqueo de SIM en HLR/HSS| OP_Claro

    %% Flujos de Datos y Fiscalización
    OP_Claro -.->|Reporte de Conexiones + Metadato de Linaje| Risk
    Risk -.->|Risk Scoring de Distribuidor y Alertas| DB_Rent
```

---

## 4. Alineación Estratégica con los Desafíos de OSIPTEL

El diseño de la visión responde directamente a las tensiones institucionales diagnosticadas:

1.  **Protección de la Autonomía:** Al estar las reglas y la arquitectura de datos desacopladas en el SIPBA, las decisiones de fiscalización y seguridad se ejecutan mediante algoritmos técnicos estandarizados, reduciendo el riesgo de interferencia política externa en las actividades operativas.
2.  **Mitigación de la Carga de Reclamos:** Al automatizar el bloqueo de SIMs suplantadas y rechazar activaciones sospechosas en tiempo real, se reduce de manera preventiva la causa raíz de más de 1.25 millones de quejas anuales asociadas a líneas no reconocidas.
3.  **Transparencia de Mercado:** El canal de reporte de conexiones de operadoras con linaje integrado permite auditar inmediatamente variaciones bruscas en el mercado móvil o fijo, eliminando incertidumbres y restaurando la confianza de inversionistas.

---

## 5. Análisis de Brechas (Gap Analysis de Alto Nivel)

*   **Brecha de Procesos:** Pasar de la dependencia del envío manual de denuncias físicas de la PNP al consumo en tiempo real del API de bloqueos del SIPBA.
*   **Brecha de Aplicaciones y Datos:** Transicionar del almacenamiento batch tradicional en RENTESEG hacia una arquitectura orientada a eventos (EDA) con pipelines de ingesta con validación de esquemas.
*   **Brecha Tecnológica:** Estandarizar la seguridad perimetral mediante el uso obligatorio de mTLS y OAuth 2.0 en todas las interfaces B2B con operadoras privadas.

