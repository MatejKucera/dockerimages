## ---------------------------------------------------------------------------------------------------------------------
## PHP ENVIRONMENT

FROM php:7.3.6-fpm AS php

RUN apt-get update -yqq && \
    apt-get install -y apt-utils zip unzip libzip-dev curl wget git mysql-client && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN docker-php-ext-install pdo_mysql bcmath zip pcntl mbstring json && \
    docker-php-ext-configure zip --with-libzip

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/bin/composer && \
    composer global require hirak/prestissimo --no-plugins --no-scripts

COPY shared/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

COPY php/entrypoint.sh /entrypoint.sh

WORKDIR /app

ENTRYPOINT ["sh", "/entrypoint.sh"]