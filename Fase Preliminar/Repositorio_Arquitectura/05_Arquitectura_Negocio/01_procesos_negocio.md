# Arquitectura de Negocio (Business Architecture)

Este documento contiene la representación de los procesos de negocio tanto en su estado actual (AS-IS) como en el objetivo (TO-BE), permitiendo un análisis de brechas claro para el sistema SIPBA.

## 1. Escenario Actual (AS-IS): Procesos Fragmentados
En el modelo actual, la falta de un Hub centralizado genera silos de información y latencias críticas de hasta 24 horas.

```mermaid
sequenceDiagram
    autonumber
    participant U as Usuario/Ciudadano
    participant O as Operadora (Silo)
    participant R as RENIEC
    participant S as Osiptel (RENTESEG)
    participant P as PNP (Denuncias)

    Note over U, O: Activación Vulnerable
    U->>O: Solicita línea (Punto ambulatorio)
    O->>O: Validación Local (Vulnerable/Manual)
    O->>R: Consulta DNI (Opcional/Offline)
    R-->>O: Respuesta
    O-->>U: Activación de Línea (Inmediata)
    O->>S: Reporte de Altas (Batch / 24-48h)

    Note over P, O: Bloqueo Reactivo (Latencia 24h)
    U->>P: Denuncia Suplantación
    P->>P: Proceso Administrativo Manual
    P-->>U: Entrega Copia de Denuncia
    Note right of P: Falta de conexión técnica con Osiptel
    U->>O: Presenta Denuncia físicamente (opcional)
    S->>S: Consolida información (Lento)
    S->>O: Notifica Bloqueo (Lista Negra Batch)
    O->>O: Ejecuta Bloqueo en Ventana Nocturna
    Note over O: Fin del Riesgo (Tarde: > 24 horas)
```

## 2. Escenario Objetivo (TO-BE): SIPBA Hub Transaccional
El nuevo modelo transforma a Osiptel en un orquestador activo que elimina la latencia y centraliza la seguridad.

```mermaid
sequenceDiagram
    autonumber
    participant U as Usuario/Ciudadano
    participant O as Operadora (Punto de Venta)
    participant S as SIPBA (Osiptel Hub)
    participant R as RENIEC
    participant P as PNP (DIVINDAT)

    Note over U, O: Proceso de Activación Crítica
    U->>O: Solicita nueva línea/reposición
    O->>O: Captura Biometría Facial (Liveness)
    O->>S: Petición de Validación (Token + Biometría)
    S->>S: Valida Regla de Negocio (Límite 7 líneas)
    alt Límite excedido o 3-Strikes
        S-->>O: Denegación Automática
    else Reglas OK
        S->>R: Consulta Identidad (Cotejo 1:1)
        R-->>S: Score de Validación + Liveness Result
        S->>S: Evalúa Score Minimo
        S-->>O: Respuesta (Aprobado/Rechazado)
        O-->>U: Activación Exitosa / Error
    end

    Note over P, S: Proceso de Bloqueo Inmediato
    U->>P: Denuncia Suplantación/Extorsión
    P->>S: Notificación de Bloqueo (Evento Real-time)
    S->>O: Instrucción de Bloqueo Automático
    O->>O: Ejecución de Bloqueo (< 1 hora)
    O-->>S: Confirmación de Bloqueo
    S-->>P: Status: Línea Inhabilitada
```

## 3. Comparativa y Gap Analysis (Brechas)

| Característica | Estado Actual (AS-IS) | Estado Objetivo (TO-BE) | Impacto |
| :--- | :--- | :--- | :--- |
| **Tiempo de Bloqueo** | ~ 24 Horas (Batch) | < 1 Hora (Real-time) | **Crítico:** Reduce ventana de extorsión. |
| **Validación Identidad** | Local / Silos | Centralizada en Hub (RENIEC) | **Alto:** Elimina suplantación en puntos de venta. |
| **Biometría** | Opcional / Sin prueba vida | Obligatoria + Liveness | **Alto:** Garantiza presencia física del titular. |
| **Rol de Osiptel** | Pasivo (Registro posterior) | Activo (Garante/Orquestador) | **Estratégico:** Control total del ecosistema. |
| **Integración PNP** | Manual / Papel | API / Eventos Digitales | **Operativo:** Eficiencia en respuesta al crimen. |

## 4. Descripción de Componentes Clave
... (Resto del documento previo)

| Componente | Función en el Negocio |
| :--- | :--- |
| **SIPBA Hub** | Orquestador de reglas de negocio y puente de confianza entre el Estado y el sector privado. |
| **Regla de Límite** | Control preventivo para evitar el acopio de líneas por parte de organizaciones criminales. |
| **Validación Biométrica** | Asegura el no repudio y la identidad real del solicitante mediante cotejo con la base nacional. |
| **Integración PNP** | Transforma la denuncia reactiva en una acción técnica proactiva e inmediata. |

## 3. Matriz de Roles y Responsabilidades (RACI Simplificada)

| Proceso | Osiptel | Operadoras | RENIEC | PNP |
| :--- | :---: | :---: | :---: | :---: |
| Activación con Biometría | A / R | C | S | I |
| Bloqueo por Denuncia | A / R | C | I | S |
| Sanción a Distribuidores | A / R | I | I | I |

*Leyenda: R (Responsible), A (Accountable), S (Support), C (Consulted), I (Informed)*
