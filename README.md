# Documentação do Projeto Guess Game

## Introdução

Este projeto consiste em uma aplicação Guess Game composta por um backend (Python com Flask), um frontend (React) e um servidor NGINX para servir a aplicação. A arquitetura foi projetada utilizando Docker Compose para facilitar a orquestração dos serviços, garantindo modularidade, escalabilidade e manutenção simplificada.

---

## Configuração

### Pré-requisitos

- Docker Desktop instalado.
- Docker Compose instalado.
- Ambiente configurado com:
  - Node.js e npm para o desenvolvimento do frontend.
  - Python e pip para o backend (em modo de desenvolvimento).
  - Acesso ao sistema para executar comandos administrativos.

### Configuração do Ambiente

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/guess-game.git
   cd guess-game
   ```
2. Configure os arquivos de variáveis de ambiente:
   - Crie um arquivo `.env` na raiz do projeto com as variáveis necessárias para o backend e banco de dados.
   Exemplo:
   ```env
   POSTGRES_USER=usuario
   POSTGRES_PASSWORD=senha
   POSTGRES_DB=guess_game_db
   FLASK_ENV=development
   ```
3. Inicie os serviços:
   ```bash
   docker-compose up -d
   ```
4. Acesse os serviços:
   - **Frontend**: `http://localhost:3000`.
   - **API Backend**: `http://localhost:5500`.

---

## Serviços

### Backend

- Localização: `backend/`
- Framework: Flask (Python)
- Funções principais:
  - Gerenciamento da lógica de jogo.
  - Exposição de APIs REST.
- Atualização de dependências:
  ```bash
  pip install -r requirements.txt
  ```

### Frontend

- Localização: `frontend/`
- Framework: React
- Ferramentas adicionais: Cypress para testes e Jest para testes unitários.
- Atualização de dependências:
  ```bash
  npm install
  ```

### Banco de Dados

- Utiliza Postgres.
- Configurado para persistência de dados em um volume Docker.
- Localização do volume: Definido no `docker-compose.yml`.

### NGINX

- Localização: `nginx/`
- Configuração customizada em `default.conf` para proxy reverso.
- Função principal: Servir os arquivos do frontend e atuar como intermediário para o backend.

---

## Atualização

### Atualizar as Imagens Docker

Para atualizar um serviço, modifique a versão da imagem no arquivo `docker-compose.yml` e reinicie os serviços:

1. Edite o arquivo `docker-compose.yml`:
   ```yaml
   services:
     backend:
       image: python:3.x
       # Substitua pela versão desejada
   ```
2. Atualize os serviços:
   ```bash
   docker-compose pull
   docker-compose up -d
   ```

### Atualizar o Código

- **Backend**:
  1. Altere o código local.
  2. Reinicie o serviço:
     ```bash
     docker-compose restart backend
     ```

- **Frontend**:
  1. Compile o frontend:
     ```bash
     npm run build
     ```
  2. Substitua os arquivos no container do NGINX, se necessário.

---

## Estrutura de Redes

- Rede customizada criada pelo Docker Compose para comunicação interna entre os serviços.
- Comunicação via hostname do container (ex.: `backend`, `frontend`).

---

## Testes

- **Frontend**: Cypress para testes end-to-end.
  ```bash
  npm run cypress
  ```
- **Backend**: Testes unitários localizados em `backend/tests/`.
  ```bash
  pytest
  ```

---

## Considerações Finais

Este projeto foi desenvolvido como uma aplicação modular, utilizando boas práticas de desenvolvimento e ferramentas modernas. Aproveite a flexibilidade proporcionada pelo Docker para ajustar os serviços conforme necessário. Em caso de dúvidas ou sugestões, abra uma issue no repositório.

