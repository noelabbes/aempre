# Recomendaciones para la Implementación y Despliegue (Fase G)
## Proyecto OSIPTEL – Sistema de Identidad Personal y Bloqueo Automático (SIPBA)

Este entregable proporciona **Directrices de Desarrollo, Optimización y Despliegue** dirigidas a los ingenieros de software, administradores de bases de datos y especialistas en DevOps. Sirve como manual de buenas prácticas para garantizar el cumplimiento de los estándares de rendimiento y seguridad exigidos en el Contrato de Arquitectura.

---

## 1. Directrices para el Desarrollo de Microservicios

Para cumplir con la latencia transaccional extrema requerida ($< 50$ ms en el core), los microservicios de la capa síncrona deben seguir estas directrices:

### 1.1. Selección de Lenguaje y Framework
*   `SIPBA-GW` y `SIPBA-CORE` (Síncronos): Desarrollar utilizando lenguajes con compilación nativa, baja latencia y recolectores de basura optimizados. Lenguajes recomendados: **Go (Golang)** o **Rust** por su excelente manejo de concurrencia nativa (goroutines / async-await) y consumo mínimo de memoria.
*   `SIPBA-ETL` y Herramientas Analíticas: Desarrollar en **Python** (utilizando librerías de alto rendimiento como Polars o PySpark).

### 1.2. Programación Asíncrona y No Bloqueante
*   **Llamadas E/S No Bloqueantes:** El consumo de bases de datos y la cola de mensajería debe realizarse mediante hilos asíncronos independientes para evitar bloquear el hilo del API Gateway.
*   **Formatos Estándar de Respuesta:** Seguir el estándar **RFC 7807** (`Problem Details`) para todas las APIs de error, facilitando a las operadoras el manejo estructurado de excepciones.

---

## 2. Hardening y Ajustes de Base de Datos y Caché

### 2.1. Optimización Física de PostgreSQL Aurora
*   **Indexación Estratégica:** Crear índices de tipo B-Tree únicamente en las columnas de búsqueda transaccional frecuente:
    ```sql
    CREATE INDEX idx_ciudadano_dni ON Ciudadano(dni);
    CREATE INDEX idx_dispositivo_imei ON Dispositivo_IMEI(imei);
    CREATE INDEX idx_transaccion_fecha ON Transaccion_Activacion(fecha_hora DESC);
    ```
*   **Timeouts de Conexión:** Configurar un `statement_timeout` máximo de 2000 ms a nivel del pool de conexiones para evitar bloqueos largos de tablas y asegurar la liberación de recursos en picos de tráfico.

### 2.2. Configuración de Redis Cluster
*   **Política de Desalojo (Eviction Policy):** Configurar Redis con la directiva `noeviction`. Esto garantiza que los contadores de rate limiting y locks distribuidos de DNI nunca sean eliminados antes de expirar por tiempo, evitando falsos positivos de bypass de seguridad.
*   **Persistencia Segura (AOF):** Habilitar `appendonly yes` y configurar `appendfsync everysec` para un balance óptimo entre persistencia (máx 1 segundo de pérdida) y velocidad de escritura.

---

## 3. Estrategia de CI/CD y Despliegue en Kubernetes (EKS)

El despliegue de las aplicaciones en el clúster gestionado de Kubernetes se realiza de forma 100% automatizada a través de pipelines de integración y entrega continua:

```
[Git Commit] ---> [1. SAST / Trivy Scan] ---> [2. Build Docker Image] ---> [3. Deploy Helm Chart] ---> [Kubernetes Pods]
```

### 3.1. Pipeline de Integración Continua (CI)
Cada confirmación de código (commit) en las ramas protegidas gatilla las siguientes fases automáticas:
1.  **Análisis Estático de Código (SAST):** SonarQube escanea el código fuente del microservicio. Se exige una cobertura de pruebas unitarias $\ge 80\%$ y cero vulnerabilidades críticas de OWASP.
2.  **Escaneo de Contenedores:** Trivy escanea la imagen Docker construida. Cualquier vulnerabilidad de nivel "Alto" o "Crítico" detiene el pipeline e impide el pase.
3.  **Registro de Imagen:** La imagen sanitizada se firma digitalmente y se almacena en un repositorio seguro y privado (Amazon ECR).

### 3.2. Pipeline de Despliegue Continuo (CD)
*   **Despliegue Declarativo (Helm):** Los pods se configuran y actualizan usando **Helm Charts** versionados, definiendo límites estrictos de CPU y memoria (`limits` y `requests`) para prevenir la degradación mutua de los contenedores.
*   **Estrategia de Despliegue:** Implementar **Canary Deployments** o **Blue-Green Deployments** controlado por el Ingress Controller (Kong), desviando inicialmente un 5% del tráfico nacional de activaciones al nuevo contenedor antes de su liberación al 100%.

### 3.3. Gestión de Secretos en el Clúster
*   **No Hardcode:** Las contraseñas de PostgreSQL, credenciales de RENIEC y llaves del HSM se inyectan en tiempo de ejecución.
*   **Uso del Secret Store CSI Driver:** Integrar Kubernetes con **AWS Secrets Manager** para montar las credenciales como variables de entorno seguras directamente en la memoria RAM de los pods de `SIPBA-CORE`, sin escribirlas en discos físicos ni archivos YAML del repositorio Git.

---
*Nota: El cumplimiento de estas recomendaciones técnicas garantiza la viabilidad y estabilidad durante la fase de operación real de la plataforma, sirviendo como insumo técnico para la gestión del ciclo de vida y la administración de cambios en la Fase H ([00_plan_fase_h.md](file:///D:/aempre/Fase%20H/00_plan_fase_h.md)).*
