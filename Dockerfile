FROM node:14.20.0

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8081

CMD [ "node", "index.js" ]