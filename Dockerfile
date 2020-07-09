FROM node

WORKDIR /

COPY package.json .
RUN npm install
COPY . .
RUN npm run build



FROM nginx
EXPOSE 80
RUN pwd
COPY --from=0 /build /usr/share/nginx/html

