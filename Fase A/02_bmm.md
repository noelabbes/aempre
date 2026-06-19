# Modelo de Motivación de Negocio (Business Motivation Model - BMM)

El BMM proporciona el fundamento estratégico del proyecto SIPBA, identificando los factores que impulsan el cambio y definiendo los medios para alcanzar los objetivos de Osiptel.

## 1. Influenciadores y Evaluaciones

### Influenciadores Externos
*   **Crimen Organizado y Extorsión:** Evolución de tácticas delictivas (SIM Swapping) y uso de líneas anónimas.
*   **Presión Ciudadana:** Demanda social por un ecosistema de telecomunicaciones seguro.
*   **Normativa Gubernamental (DL 1738):** Obligación legal de reforzar controles de identidad.

### Influenciadores Internos
*   **Latencia Operativa Actual:** Ventanas de bloqueo de hasta 24 horas (reactivo).
*   **Silos de Información:** Falta de visibilidad en tiempo real de las activaciones.
*   **Vulnerabilidad en Cadena de Suministro:** Riesgo en ventas ambulatorias y distribuidores.

### Matriz de Assessment (Evaluación)
| Influenciador | Urgencia | Impacto | Control | Evaluación |
| :--- | :---: | :---: | :---: | :--- |
| **Crimen organizado (SIM Swapping)** | 5 | 5 | 2 | Riesgo crítico externo. |
| **Cumplimiento Normativo (DL 1738)** | 5 | 4 | 3 | Obligación legal prioritaria. |
| **Latencia de 24h en bloqueos** | 5 | 5 | 5 | Oportunidad de mejora directa (SIPBA). |
| **Corrupción/Venta ambulatoria** | 4 | 5 | 4 | Punto de control clave en el canal. |

## 2. Fines (Ends)

### Metas (Goals)
*   Convertir a Osiptel en el garante absoluto de un ecosistema digital seguro.
*   Erradicar el anonimato y garantizar que la identidad móvil sea inalterable.
*   Restablecer la confianza ciudadana en las telecomunicaciones.

### Objetivos SMART
*   **SLA de Bloqueo:** Reducir de 24 horas a **menos de 1 hora**.
*   **Cobertura Biométrica:** 100% de activaciones críticas con biometría facial en **12 meses**.
*   **Reducción de Fraude:** Disminuir el SIM Swapping en un **80%** en el primer semestre.

## 3. Medios (Means)

### Misión
Operar y administrar el Hub Transaccional SIPBA en tiempo real, interconectando Operadoras, RENIEC y PNP para validar identidades y ejecutar bloqueos inmediatos.

### Estrategias y Tácticas
*   **Estrategia:** Transformación de Osiptel en un Hub Transaccional Intermediario.
*   **Táctica 1:** Piloto de Integración de APIs con la PNP para estandarizar reportes.
*   **Táctica 2:** Despliegue del API Gateway en "Modo Observación" (Shadow Mode) para medir latencias.
*   **Táctica 3:** Auditorías offline focalizadas en distribuidores de alto riesgo.

## 4. Directivas (Políticas y Reglas de Negocio)

### Políticas
*   **Tolerancia Cero a la Suplantación:** Sin excepciones manuales ni activaciones diferidas.
*   **Privacidad por Diseño:** Prohibido almacenar imágenes crudas; solo se valida el score.

### Reglas de Negocio
*   **Regla Liveness:** Denegación automática si no se supera el score mínimo de RENIEC.
*   **Regla de Límite:** Bloqueo inmediato si el titular supera las 7 líneas móviles.
*   **Regla de Penalización (3 Strikes):** Revocación automática del Token de Acceso tras 3 activaciones fraudulentas.

## 5. Trazabilidad (Hilos Conductores)
1.  **Contra el SIM Swapping:** Crimen Organizado (5) $\rightarrow$ Erradicar Anonimato $\rightarrow$ API Gateway $\rightarrow$ Regla Liveness.
2.  **Contra la Extorsión:** Latencia 24h (5) $\rightarrow$ SLA < 1 hora $\rightarrow$ Integración RENTESEG-PNP $\rightarrow$ Piloto de APIs.
