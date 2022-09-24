FROM node as node
WORKDIR /app
COPY / ./
COPY package*.json ./

RUN npm install && \
    npm run build 
COPY . .

FROM nginx:latest 
WORKDIR /app
RUN mkdir /usr/share/nginx/html/balancoempresarial/
COPY --from=node /app/dist/balancoempresarial/ /usr/share/nginx/html/balancoempresarial/

EXPOSE 82

##docker run -d -p 80:82 --name balanco-empresarial-angular  hugopaul/balanco-empresarial-angular
##docker build -t=hugopaul/balanco-empresarial-angular .