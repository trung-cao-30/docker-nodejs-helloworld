FROM node:22.3 as builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

FROM node:22.3-alpine3.19

WORKDIR /app

COPY --from=builder /app .

RUN chown -R node:node .

USER node

ENV NODE_ENV=production

RUN npm install --only=production

EXPOSE 8081

CMD [ "node", "index.js" ]