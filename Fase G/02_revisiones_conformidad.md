# Guía de Revisiones de Conformidad (Fase G)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable establece la **Guía de Revisiones de Conformidad de la Arquitectura** (Architecture Compliance Reviews). Define el proceso de auditoría y las listas de verificación (checklists) que la GTIC de OSIPTEL aplicará sobre los desarrollos de software e infraestructura antes de certificar el pase a producción de cualquier componente de SIPBA.

---

## 1. Fases del Proceso de Auditoría de Conformidad

La evaluación de cumplimiento técnico se ejecuta en tres etapas obligatorias a lo largo del ciclo de vida del desarrollo (WP1 al WP4):

```
+--------------------------+     +--------------------------+     +--------------------------+
|  FASE 1: DISEÑO DETALLADO| --> |  FASE 2: PRUEBAS SANDBOX | --> | FASE 3: PRE-PRODUCCIÓN   |
|  - Auditoría de Planos y |     |  - Pruebas Funcionales,  |     |  - Pruebas de Estrés y   |
|    Contratos de APIs.    |     |    SAST/DAST y mTLS.     |     |    Simulacro de DRP.     |
+--------------------------+     +--------------------------+     +--------------------------+
```

### Fase 1: Revisión del Diseño Detallado (Hito de Diseño)
*   *Objetivo:* Asegurar que los planos técnicos detallados del software (diseño de clases, esquemas relacionales físicos y especificaciones de OpenAPI/Swagger) coincidan exactamente con la arquitectura conceptual de SIPBA.
*   *Acción:* El proveedor presenta la documentación técnica. La GTIC emite un informe de conformidad aprobando o rechazando el inicio del desarrollo.

### Fase 2: Auditoría del Sandbox de Pruebas (Hito de Desarrollo)
*   *Objetivo:* Auditar el código fuente construido y desplegado en el entorno Sandbox.
*   *Acción:* Se ejecutan análisis estáticos de código (SAST) y dinámicos (DAST) para verificar la seguridad, se comprueba la correcta orquestación con el API de RENIEC y se valida la firma de tokens en el sandbox.

### Fase 3: Certificación Pre-Producción (Hito de Despliegue)
*   *Objetivo:* Certificar el comportamiento del sistema bajo carga de producción y tolerancia a fallas.
*   *Acción:* Ejecución de pruebas de estrés (mínimo 200 TPS), pruebas de corte de comunicación de RENIEC (comprobación del Circuit Breaker) y pruebas de Failover de base de datos Aurora Global Database.

---

## 2. Lista de Chequeo de Conformidad (Architecture Compliance Checklist)

La siguiente tabla resume los puntos clave que los auditores de OSIPTEL deben verificar y marcar como conformes:

| Dominio | Punto de Verificación | Método de Validación | Cumple |
| :--- | :--- | :--- | :---: |
| **Seguridad de APIs** | Uso obligatorio de TLS 1.3 y mTLS con certificados firmados por OSIPTEL. | Inspección de apretón de manos (Handshake) con Wireshark/OpenSSL. | [ ] |
| **No Repudio** | Firma digital válida en la cabecera `X-Signature` firmada por la llave privada de la operadora. | Verificación criptográfica con la llave pública del operador en el API Gateway. | [ ] |
| **Privacidad LPDP** | Las imágenes de rostros en Base64 enviadas a RENIEC se limpian de memoria RAM y no se escriben en logs ni bases de datos de OSIPTEL. | Revisión del código fuente del API Gateway (`Scrubbing Filters`) y auditoría de archivos de log. | [ ] |
| **Core de Reglas** | Denegación automática al superar el límite de 7 líneas móviles activas por ciudadano. | Inyección de solicitud de activación número 8 de prueba en el Sandbox. | [ ] |
| **Resiliencia** | Activación del bypass de contingencia biométrica offline al simular caída del API de RENIEC. | Bloqueo intencional de la IP de RENIEC y verificación del estado del Circuit Breaker. | [ ] |
| **Redes de Pods** | Aislamiento de tráfico de red entre pods (Network Policies de Calico activas). | Intento de conexión SSH directa desde pod Ingress a pod de Base de Datos. | [ ] |
| **Auditoría Interna** | Registro cifrado del DNI de ciudadanos y enmascaramiento dinámico (PII) en herramientas de monitoreo. | Inspección de la BD de auditoría transaccional de PostgreSQL. | [ ] |

---

## 3. Plantilla del Reporte de Conformidad de la Arquitectura

Los auditores registrarán las revisiones utilizando la siguiente plantilla oficial:

```markdown
# Reporte de Conformidad de Arquitectura SIPBA
**ID Reporte:** SIPBA-CR-2026-XXXX  
**Fecha de Evaluación:** AAAA-MM-DD  
**Evaluador:** GTIC OSIPTEL  
**Componente Evaluado:** [Nombre del Microservicio / Infraestructura / Operadora]  

## 1. Resumen Ejecutivo de la Evaluación
[Breve descripción del estado del componente y recomendación final de pase o rechazo a producción].

## 2. Estado de Criterios Críticos
*   **Seguridad de Red y mTLS:** [CONFORME / NO CONFORME / PENDIENTE]
*   **Contratos e Integración JSON:** [CONFORME / NO CONFORME / PENDIENTE]
*   **Protección de Datos Personales (LPDP):** [CONFORME / NO CONFORME / PENDIENTE]
*   **Rendimiento y SLA Transaccional:** [CONFORME / NO CONFORME / PENDIENTE]

## 3. Hallazgos y Desviaciones de Diseño
*   **Hallazgo 01:** [Detalle del desvío de arquitectura, ej. "Se detectó que el log del API Gateway está imprimiendo el DNI del abonado en texto plano"].
    *   *Gravedad:* [Crítica / Mayor / Menor]
    *   *Acción Correctiva Obligatoria:* [ej. "Implementar máscara Regex en el serializador de logs para ocultar caracteres intermedios"].

## 4. Firma de Autorización Técnica
-------------------------------------------
Firma del Auditor Jefe de Arquitectura - GTIC
```

---
*Nota: Para facilitar a los desarrolladores el cumplimiento de esta guía, se proporcionan las directrices físicas de programación y optimización en las Recomendaciones para la Implementación ([03_recomendaciones_despliegue.md](file:///D:/aempre/Fase%20G/03_recomendaciones_despliegue.md)).*
