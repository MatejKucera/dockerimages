## ---------------------------------------------------------------------------------------------------------------------
## PHP ENVIRONMENT

FROM php:7.3.6-fpm AS php

RUN apt-get update -yqq && \
    apt-get install -y apt-utils zip unzip libzip-dev curl wget git mysql-client && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-install pdo_mysql bcmath zip pcntl mbstring && \
    docker-php-ext-configure zip --with-libzip

COPY shared/wait-for-it.sh /wait-for-it.sh

WORKDIR /app




## ---------------------------------------------------------------------------------------------------------------------
## PHP DEBUG ENVIRONMENT

FROM php AS php-debug

RUN apt-get update -yqq && \
    apt-get install -y telnet iputils-ping htop nano && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl install xdebug && \
    docker-php-ext-enable xdebug