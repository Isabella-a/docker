# Use uma imagem oficial do Python como base
FROM python:3.8-slim

# Defina o diretório de trabalho no container
WORKDIR /app

# Copie os arquivos do backend para o container
COPY ./guess /app/guess
COPY ./repository /app/repository

# Copie o arquivo de requisitos e instale as dependências
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copie o script start-backend.sh
COPY ./start-backend.sh /app/start-backend.sh
RUN chmod +x /app/start-backend.sh

# Exponha a porta em que o Flask vai rodar
EXPOSE 5500

# Defina o comando para rodar o Flask
CMD ["./start-backend.sh"]
