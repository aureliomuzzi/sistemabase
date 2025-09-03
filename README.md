🚀 Sistema Base – Laravel + Nuxt + Docker

Este projeto contém uma arquitetura moderna baseada em Laravel (backend), Nuxt (frontend), MariaDB (banco de dados), phpMyAdmin (gerenciamento do banco) e Nginx (proxy reverso e servidor web).
Tudo rodando em containers Docker, de forma modular e escalável.

📂 Estrutura do Projeto
.
├── backend/              # Aplicação Laravel (PHP 8.3 + Composer)
│   ├── Dockerfile        # Dockerfile do Laravel
│   ├── .env.example      # Exemplo de variáveis de ambiente
│   └── ...
│
├── frontend/             # Aplicação Nuxt (Vue 3 + Vite)
│   ├── Dockerfile        # Dockerfile do Nuxt
│   ├── .env.example      # Exemplo de variáveis de ambiente
│   └── ...
│
├── nginx/                # Configuração do Nginx
│   └── default.conf
│
├── docker-compose.yml    # Orquestra todos os serviços
├── Makefile              # Atalhos para simplificar os comandos
└── README.md             # Este arquivo

🛠️ Serviços
🔹 Backend (Laravel)

Rodando em PHP 8.3

Servido pelo Nginx

Conectado ao MariaDB

Localizado em backend/

🔹 Frontend (Nuxt 3)

Baseado em Node.js 20

Build e servido na porta 3000

Localizado em frontend/

🔹 Banco de Dados (MariaDB)

Imagem oficial mariadb:11.4

Banco inicial: laravel

Usuário padrão: laravel / Senha: laravel

Acesso root: root / Senha: root

🔹 phpMyAdmin

Interface web para gerenciamento do banco

Conectado ao serviço db

Usuário e senha conforme definidos no docker-compose.yml

🔹 Nginx

Responsável por proxy reverso

Faz a ponte entre frontend e backend

Configuração em nginx/default.conf

⚡ Comandos Úteis
1. Subir todos os serviços
docker-compose up -d --build

2. Ver logs dos containers
docker-compose logs -f

3. Reiniciar apenas o backend (Laravel)
docker-compose restart backend

4. Entrar no container do backend
docker exec -it sistemabase-backend bash

5. Rodar migrations do Laravel
docker exec -it sistemabase-backend php artisan migrate

6. Derrubar todos os containers
docker-compose down

7. Derrubar e apagar volumes (reset do banco)
docker-compose down -v

🌐 Acesso aos Serviços

Frontend (Nuxt) → http://app.localhost

Backend (Laravel) → http://api.localhost

phpMyAdmin → http://localhost:8080

🔧 Desenvolvimento
Rodar Laravel em modo desenvolvimento
docker exec -it sistemabase-backend php artisan serve --host=0.0.0.0 --port=8000

Rodar Nuxt em modo desenvolvimento
docker exec -it sistemabase-frontend npm run dev -- --host

🚀 Produção

Na versão de produção, o Nuxt é buildado e servido diretamente pelo container:

docker-compose -f docker-compose.yml up -d --build

📌 Exemplos de .env
🔹 Laravel (backend/.env)
APP_NAME=Laravel
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://api.localhost

LOG_CHANNEL=stack
LOG_DEPRECATIONS_CHANNEL=null
LOG_LEVEL=debug

DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=laravel

BROADCAST_DRIVER=log
CACHE_DRIVER=file
FILESYSTEM_DISK=local
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

🔹 Nuxt (frontend/.env)
# URL do backend Laravel
NUXT_PUBLIC_API_URL=http://api.localhost

# Porta do frontend
NUXT_PORT=3000

⚡ Atalhos com Make

Este projeto possui um Makefile que encapsula os comandos mais usados do Docker e Artisan.
Na raiz do projeto, você pode usar:

Containers
make up          # Subir todos os serviços
make down        # Derrubar todos os serviços
make reset       # Derrubar e apagar volumes (reset banco)
make logs        # Ver logs
make restart     # Reiniciar containers
make ps          # Listar containers ativos

Backend (Laravel)
make migrate          # Rodar migrations
make seed             # Rodar seeders
make artisan cmd="tinker"   # Executar comando artisan (exemplo)
make backend-bash     # Entrar no container backend

Frontend (Nuxt)
make frontend-dev     # Rodar Nuxt em modo desenvolvimento
make frontend-build   # Fazer build de produção
make frontend-bash    # Entrar no container frontend

📌 Observações

O volume db_data garante persistência do banco de dados mesmo após reiniciar os containers.

Você pode personalizar as variáveis de ambiente no docker-compose.yml.

Para ambientes de produção, recomenda-se configurar .env com credenciais seguras.