FROM nginx:stable-alpine3.17-slim

# Essentials
RUN echo "Asia/Jakarta" > /etc/timezone
RUN apk add --no-cache zip unzip curl supervisor

# Installing bash
RUN apk add bash
RUN sed -i 's/bin\/ash/bin\/bash/g' /etc/passwd

# Installing PHP
RUN apk add --no-cache php81 \
    php81-common \
    php81-fpm \
    php81-pdo \
    php81-opcache \
    php81-zip \
    php81-phar \
    php81-iconv \
    php81-cli \
    php81-curl \
    php81-openssl \
    php81-mbstring \
    php81-tokenizer \
    php81-fileinfo \
    php81-json \
    php81-xml \
    php81-xmlwriter \
    php81-simplexml \
    php81-dom \
    php81-pdo_mysql \
    php81-pdo_sqlite \
    php81-tokenizer \
    php81-pecl-redis

# Installing composer
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN rm -rf composer-setup.php

# Configure supervisor
RUN mkdir -p /etc/supervisor.d/
COPY configs/supervisord/supervisord.ini /etc/supervisor.d/supervisord.ini

# Configure PHP
RUN mkdir -p /run/php/
RUN touch /run/php/php8.1-fpm.pid

COPY configs/php/php-fpm.conf /etc/php81/php-fpm.conf
COPY configs/php/php.ini-production /etc/php81/php.ini

# Configure nginx
COPY configs/nginx/nginx.conf /etc/nginx/nginx.conf
COPY configs/nginx/nginx-laravel.conf /etc/nginx/modules/nginx-laravel.conf

RUN mkdir -p /run/nginx/
RUN touch /run/nginx/nginx.pid

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["supervisord", "-c", "/etc/supervisor.d/supervisord.ini"]
