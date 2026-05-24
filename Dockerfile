# ========================================================
# ETAPA 1 - Compilacion React con Node.js
# ========================================================
FROM node:20-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

# ========================================================
# ETAPA 2 - Servidor Nginx para archivos estaticos
# ========================================================
FROM nginx:1.19.0-alpine

COPY --from=build /app/dist/ /usr/share/nginx/html

EXPOSE 80
