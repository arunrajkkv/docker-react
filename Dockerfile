FROM node:alpine AS nodecontainer
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=nodecontainer /app/build /usr/share/nginx/html
