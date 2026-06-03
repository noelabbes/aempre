# Makefile para Expo/React Native - Blue Project
# "Systems & High Performance" Edition

.PHONY: help dev android ios clean preview production save sync-ci sync-ci-no-git

# Detectamos automáticamente la rama de Git
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

# --- MENÚ DE AYUDA ---
help:
	@echo "🛠️  COMANDOS DISPONIBLES:"
	@echo "   make dev         -> Inicia servidor con caché limpia"
	@echo "   make android     -> Corre la app en Android"
	@echo "   make ios         -> Corre la app en iOS"
	@echo "   make doctor      -> Diagnóstico de Expo"
	@echo "   make preview     -> Build en la nube (Preview)"
	@echo "   make prod        -> Build en la nube + Submit (Production)"
	@echo "   make clean       -> Limpieza profunda (Windows Friendly)"
	@echo "   make save m=...  -> Git add + commit + push"

# --- DESARROLLO ---
dev:
	npx expo start -c

android:
	npx expo run:android

ios:
	npx expo run:ios

doctor:
	npx expo doctor

# --- EAS / NUBE ---
preview:
	eas build -p android --profile preview

prod:
	eas build -p android --profile production --auto-submit

# --- MANTENIMIENTO (Versión Windows) ---
clean:
	@echo "🧹 Limpiando node_modules y cachés..."
	-rm -rf node_modules
	-rm -rf package-lock.json yarn.lock
	npm install
	@echo "✨ Entorno fresco y dependencias reinstaladas."

# --- GIT AUTOMATION (Versión Windows CMD) ---
save:
	@if "$(m)"=="" ( \
		echo ❌ Error: Debes poner un mensaje. Uso: gs "mensaje" & \
		exit 1 \
	)
	@echo 📦 Empaquetando cambios en la rama: $(BRANCH)...
	git add .
	git commit -m "$(m)"
	git push origin $(BRANCH)
	@echo ✅ Listo. Codigo subido a $(BRANCH).

# Sincroniza tu rama actual con los últimos cambios de main para evitar conflictos
sync:
	@echo "🔄 Sincronizando $(BRANCH) con main..."
	git fetch origin main
	git merge origin/main
	@echo "✅ Tu rama está al día con main."

# --- SERVIDOR / DEPLOY ---
sync-server:
	@echo "🔄 Sincronizando servidor con GitHub (Branch: $(BRANCH))..."
	git fetch origin $(BRANCH)
	git reset --hard origin/$(BRANCH)
	git clean -fd
	@echo "✅ Servidor actualizado y limpio."

sync-start:
	@echo "🔄 Sincronizando servidor (Branch: $(BRANCH))..."
	git fetch origin $(BRANCH)
	git reset --hard origin/$(BRANCH)
	git clean -fd
	docker compose up -d --build --remove-orphans --wait
	@echo "🧹 Limpiando imágenes antiguas..."
	docker image prune -f
	@echo "✅ Despliegue completado con éxito."

# --- RECUPERACIÓN DE ERRORES ---
rollback:
	@echo "⚠️  Revirtiendo cambios no commiteados..."
	git reset --hard HEAD
	git clean -fd
	@echo "✨ Estado limpio restaurado al último commit funcional."

# --- SERVIDOR / DEPLOY (Backend Edition) ---
sync-safe:
	@echo "💾 Creando snapshot del commit actual..."
	$(eval OLD_COMMIT := $(shell git rev-parse HEAD))
	@echo "🔄 Intentando actualizar a $(BRANCH)..."
	git fetch origin $(BRANCH)
	git reset --hard origin/$(BRANCH)
	git clean -fd
	docker compose up -d --build --remove-orphans --wait || $(MAKE) rollback-server hash=$(OLD_COMMIT)
	@echo "✅ Despliegue completado con éxito."

rollback-server:
	@echo "🚨 ERROR DETECTADO. Iniciando rollback al commit: $(hash)"
	git reset --hard $(hash)
	docker compose up -d --build --remove-orphans
	@echo "🛡️ Servidor restaurado a la versión estable anterior."

# --- MANTENIMIENTO PRO ---
clean-img:
	@echo "🧹 Eliminando imágenes antiguas de GHCR..."
	docker image prune -a -f --filter "until=72h"
	@echo "✨ Disco optimizado (se mantuvieron imágenes de las últimas 72h)."

# --- SERVIDOR / DEPLOY (Backend Edition) ---

sync-ci:
	@echo "🔄 Sincronizando servidor (Branch: $(BRANCH))..."
	git fetch origin $(BRANCH)
	git reset --hard origin/$(BRANCH)
	# git clean -fd eliminado: ya no se suben archivos manuales vía SCP.
	# Las credenciales llegan desde GitHub Secrets via el workflow de deploy
	# y deben persistir entre el fetch y el docker compose up.

	@echo "📥 Descargando nueva imagen desde GHCR..."
	docker compose pull backend

	@echo "🚀 Levantando nueva versión..."
	docker compose up -d --remove-orphans --wait || ( \
		echo "❌ El contenedor no alcanzó estado healthy."; \
		echo "📋 Últimas líneas del log:"; \
		docker compose logs --tail=20 backend; \
		if ! docker image inspect ghcr.io/noelabbes/blue:stable > /dev/null 2>&1; then \
			echo "⛔ No existe imagen :stable. Primer deploy fallido — rollback manual requerido."; \
			exit 1; \
		fi; \
		echo "🚨 Iniciando rollback a :stable (último funcional confirmado)..."; \
		docker compose stop backend; \
		docker tag ghcr.io/noelabbes/blue:stable ghcr.io/noelabbes/blue:latest; \
		docker compose up -d --wait backend \
			&& echo "✅ Servidor restaurado al último estado estable." \
			|| echo "⛔ El rollback también falló. Intervención manual urgente."; \
		exit 1; \
	)

	@echo "✅ Aplicación viva. Promoviendo imagen a :stable..."
	docker tag ghcr.io/noelabbes/blue:latest ghcr.io/noelabbes/blue:stable
	@echo "🧹 Limpiando imágenes antiguas..."
	docker image prune -f
	@echo "🚀 Despliegue exitoso."

# Igual que sync-ci pero SIN git pull.
# Usado por el workflow de CI/CD: el git reset lo hace GitHub Actions
# antes de escribir el .env, así las credenciales no son pisadas por el reset.
sync-ci-no-git:
	@echo "📥 Descargando nueva imagen desde GHCR..."
	docker compose pull backend

	@echo "🚀 Levantando nueva versión..."
	docker compose up -d --remove-orphans --wait || ( \
		echo "❌ El contenedor no alcanzó estado healthy."; \
		echo "📋 Últimas líneas del log:"; \
		docker compose logs --tail=20 backend; \
		if ! docker image inspect ghcr.io/noelabbes/blue:stable > /dev/null 2>&1; then \
			echo "⛔ No existe imagen :stable. Primer deploy fallido — rollback manual requerido."; \
			exit 1; \
		fi; \
		echo "🚨 Iniciando rollback a :stable (último funcional confirmado)..."; \
		docker compose stop backend; \
		docker tag ghcr.io/noelabbes/blue:stable ghcr.io/noelabbes/blue:latest; \
		docker compose up -d --wait backend \
			&& echo "✅ Servidor restaurado al último estado estable." \
			|| echo "⛔ El rollback también falló. Intervención manual urgente."; \
		exit 1; \
	)

	@echo "✅ Aplicación viva. Promoviendo imagen a :stable..."
	docker tag ghcr.io/noelabbes/blue:latest ghcr.io/noelabbes/blue:stable
	@echo "🧹 Limpiando imágenes antiguas..."
	docker image prune -f
	@echo "🚀 Despliegue exitoso."
