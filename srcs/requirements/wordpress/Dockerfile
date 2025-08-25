FROM php:7.4-fpm-alpine

RUN apk update && apk add --no-cache \
        mysql-client \
        curl \
        libpng \
        libpng-dev \
        libjpeg-turbo-dev \
        libwebp-dev \
        libxpm-dev \
        freetype-dev \
        libzip-dev \
        oniguruma-dev \
        autoconf \
        g++ \
        make \
        bash

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN curl -o wordpress.tar.gz -L https://wordpress.org/latest.tar.gz \
    && mkdir -p /var/www/html \
    && tar -xzvf wordpress.tar.gz -C /var/www/html --strip-components=1 \
    && rm wordpress.tar.gz

RUN chown -R www-data:www-data /var/www/html

COPY ./tools/setup.sh /setup.sh
RUN chmod +x /setup.sh
CMD ["/setup.sh"]

