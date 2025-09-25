#!/bin/sh

mkdir -p /etc/ssl/certs /etc/ssl/private

openssl req -x509 -nodes -days 365 \
    -subj "/C=LU/ST=Luxembourg/L=Lux/O=42/OU=Student/CN=${DOMAIN_NAME}" \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx.key \
    -out /etc/ssl/certs/nginx.crt
