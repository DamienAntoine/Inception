FROM nginx:alpine

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

RUN apk update && apk add --no-cache openssl

COPY ./tools/init.sh /init.sh
RUN chmod +x /init.sh && /init.sh

