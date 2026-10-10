FROM node:22-alpine

WORKDIR /app

COPY server.js .
COPY src/index.html .
COPY src/images ./images
COPY package.json .

RUN npm install

EXPOSE 3000

CMD ["node", "server.js"]
