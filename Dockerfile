FROM node as builder
WORKDIR "/app"
COPY package.json .

RUN npm config set registry http://registry.npmjs.org
RUN npm install

COPY . .

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
