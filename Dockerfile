FROM alpine:3.5

ADD entrypoint.sh /opt/entrypoint.sh
ADD run-unblockNeteaseMusic.sh /opt/run-unblockNeteaseMusic.sh
ADD run-v2ray.sh /opt/run-v2ray.sh

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && chmod +x /opt/entrypoint.sh && chmod +x /opt/run-unblockNeteaseMusic.sh && chmod +x /opt/run-v2ray.sh && apk add --update nodejs npm --repository=http://dl-cdn.alpinelinux.org/alpine/latest-stable/main/

ENV NODE_ENV production

WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install --production
COPY . .

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]
