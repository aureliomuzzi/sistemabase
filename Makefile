# 📌 Makefile para SistemaBase
# Simplifica comandos Docker + Laravel + Nuxt

COMPOSE = docker-compose
EXEC_BACKEND = $(COMPOSE) exec backend
EXEC_FRONTEND = $(COMPOSE) exec frontend

# ----------------------------
# Containers
# ----------------------------
up:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

reset:
	$(COMPOSE) down -v

logs:
	$(COMPOSE) logs -f

restart:
	$(COMPOSE) restart

ps:
	$(COMPOSE) ps

# ----------------------------
# Backend (Laravel)
# ----------------------------
migrate:
	$(EXEC_BACKEND) php artisan migrate

seed:
	$(EXEC_BACKEND) php artisan db:seed

artisan:
	$(EXEC_BACKEND) php artisan $(cmd)

tinker:
	$(EXEC_BACKEND) php artisan tinker

backend-bash:
	$(EXEC_BACKEND) bash

# ----------------------------
# Frontend (Nuxt)
# ----------------------------
frontend-dev:
	$(EXEC_FRONTEND) npm run dev -- --host

frontend-build:
	$(EXEC_FRONTEND) npm run build

frontend-bash:
	$(EXEC_FRONTEND) bash

