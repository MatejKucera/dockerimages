## ---------------------------------------------------------------------------------------------------------------------
## PHP ENVIRONMENT

FROM php:7.3.6-fpm AS php

RUN apt-get update -yqq && \
    apt-get install -y apt-utils zip unzip libzip-dev curl wget git mysql-client && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-install pdo_mysql bcmath zip pcntl mbstring json && \
    docker-php-ext-configure zip --with-libzip

COPY shared/wait-for-it.sh /wait-for-it.sh

WORKDIR /app

ENTRYPOINT ["sh", "/entrypoint.sh"]