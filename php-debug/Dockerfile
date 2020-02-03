## ---------------------------------------------------------------------------------------------------------------------
## PHP DEBUG ENVIRONMENT

FROM matejkucera/php AS php-debug

RUN apt-get update -yqq && \
    apt-get install -y telnet iputils-ping htop nano && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pecl install xdebug && \
    docker-php-ext-enable xdebug