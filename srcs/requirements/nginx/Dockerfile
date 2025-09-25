FROM nginx:alpine

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf

COPY ./tools/init.sh /init.sh
RUN chmod +x /init.sh

RUN apk update && apk add --no-cache openssl

CMD ["/bin/sh", "-c", "/init.sh && nginx -g 'daemon off;'"]
