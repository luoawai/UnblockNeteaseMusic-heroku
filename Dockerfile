FROM alpine:3.5

ADD entrypoint.sh /opt/entrypoint.sh

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && chmod +x /opt/entrypoint.sh && apk add --update nodejs npm --repository=http://dl-cdn.alpinelinux.org/alpine/latest-stable/main/

ENTRYPOINT ["sh", "-c", "/opt/entrypoint.sh"]
