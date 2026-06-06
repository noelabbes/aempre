# Arquitectura de Negocio (Business Architecture)

Este documento contiene la representación de los procesos de negocio objetivo (TO-BE) para el sistema SIPBA, enfocándose en la interacción entre los actores clave para mitigar el fraude de identidad.

## 1. Diagrama de Procesos TO-BE (SIPBA Hub Transaccional)

El siguiente diagrama ilustra el flujo de negocio central, donde Osiptel actúa como un Hub que orquesta la validación de identidad y el bloqueo inmediato de líneas.

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

## 2. Descripción de Componentes del Diagrama

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
