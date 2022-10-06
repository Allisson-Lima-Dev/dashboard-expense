FROM node:16-alpine

# faz da pasta 'app' o diretório atual de trabalho
WORKDIR /app

# copia os arquivos 'package.json' e 'yarn.lock'
COPY package.json yarn.lock ./

# instala e builda dependências do projeto
RUN yarn install
COPY next.config.js ./next.config.js

COPY . .
RUN yarn build

# Escuta a porta 3000 do next
EXPOSE 3000

# Seta usuário node
USER node

# starta
CMD ["yarn", "start"]