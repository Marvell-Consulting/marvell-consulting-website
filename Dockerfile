FROM node:12-alpine

RUN apk upgrade --no-cache
RUN addgroup -S app
RUN adduser -S app -G app -u 999 -h /app/
RUN chown -R app:app /app/

USER 999
WORKDIR /app

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN npm ci --production --no-optional
COPY . /app

CMD node app.js
