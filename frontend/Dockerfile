# Use a imagem oficial do Node.js
FROM node:18.17.0

# Defina o diretório de trabalho no container
WORKDIR /app

# Copie os arquivos do projeto para o container
COPY ./ /app

# Instale as dependências do frontend
RUN npm install

# Exponha a porta que o React vai rodar
EXPOSE 3000

# Comando para iniciar o frontend
CMD ["yarn", "start"]
