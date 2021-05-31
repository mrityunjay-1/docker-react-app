FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# this is going to map port at 80
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html