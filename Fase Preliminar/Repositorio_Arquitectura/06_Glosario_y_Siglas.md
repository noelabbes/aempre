# Glosario y Definiciones: Proyecto SIPBA

Este documento centraliza los términos técnicos, siglas y conceptos clave utilizados en la Arquitectura Empresarial del proyecto para Osiptel.

## 1. Siglas Principales del Proyecto

| Sigla | Significado Literal | Definición en el Contexto SIPBA |
| :--- | :--- | :--- |
| **SIPBA** | **S**istema de **I**dentidad **P**ersonal y **B**loqueo **A**utomático | Es el nombre del proyecto y de la plataforma "Hub" que orquesta las validaciones de identidad entre Osiptel, RENIEC y las Operadoras. |
| **RENTESEG** | **R**egistro Nacional de Equipos **T**erminales Móviles para la **Seg**uridad | Base de datos administrada por Osiptel que contiene el registro de todos los celulares legales en Perú y la lista negra de equipos robados o bloqueados. |
| **OSIPTEL** | **O**rganismo **S**upervisor de **I**nversión **P**rivada en **Tel**ecomunicaciones | El ente regulador de las telecomunicaciones en Perú y promotor del proyecto SIPBA. |
| **RENIEC** | **R**egistro **N**acional de **I**dentificación y **E**stado **C**ivil | Entidad estatal proveedora de la identidad oficial de los ciudadanos y de los servicios de cotejo biométrico. |
| **DIVINDAT** | **Divi**sión de Investigación de **D**elitos de **A**lta **T**ecnología | Unidad especializada de la PNP que combate el cibercrimen y es el actor clave para las denuncias de SIM Swapping. |

## 2. Conceptos de Arquitectura y Negocio

| Término | Definición |
| :--- | :--- |
| **SIM Swapping** | Técnica de fraude donde un delincuente suplanta al titular de una línea para obtener un duplicado de la tarjeta SIM, ganando acceso a sus cuentas bancarias y redes sociales. |
| **Liveness Detection** | (Detección de Vida) Tecnología biométrica que asegura que la cara capturada por la cámara es de una persona viva y físicamente presente, evitando el uso de fotos o videos. |
| **Hub Transaccional** | Un modelo de arquitectura donde un sistema central (SIPBA) actúa como intermediario, validando y distribuyendo información entre múltiples partes interesadas. |
| **Arquitectura Empresarial (AE)** | Práctica que alinea la estrategia de negocio con la tecnología para optimizar los procesos y la estructura de una organización. |
| **Gap Analysis** | (Análisis de Brechas) Estudio que identifica la distancia entre el estado actual (donde estamos hoy) y el estado deseado (donde queremos llegar). |

## 3. Terminología Metodológica (TOGAF/ADM)

| Término | Definición |
| :--- | :--- |
| **ADM** | **A**rchitecture **D**evelopment **M**ethod. El ciclo de vida de 10 fases utilizado por TOGAF para desarrollar arquitecturas empresariales. |
| **AS-IS** | El estado actual de la organización, con sus procesos, deficiencias y sistemas actuales. |
| **TO-BE** | El estado objetivo o visión futura que se espera alcanzar tras implementar el proyecto. |
| **BMM** | **B**usiness **M**otivation **M**odel. Modelo que explica el "por qué" de un proyecto (Metas, Estrategias, Influenciadores). |
| **RACI** | Matriz de responsabilidades: **R**esponsable (quien hace la tarea), **A**ccountable (quien rinde cuentas), **C**onsultado (quien da consejos), **I**nformado (quien recibe noticias). |
| **Stakeholder** | Cualquier persona o entidad que tenga un interés en el proyecto o se vea afectado por él. |

---
*Este glosario es una herramienta viva y se actualizará a medida que el proyecto avance hacia las fases técnicas.*
