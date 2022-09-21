FROM node as node
WORKDIR /app
COPY / ./
COPY package*.json ./

RUN npm install && \
    npm run build
COPY . .

FROM nginx:latest 
WORKDIR /app
COPY --from=node /app/dist/balancoempresarialfront/ /usr/share/nginx/html
EXPOSE 82