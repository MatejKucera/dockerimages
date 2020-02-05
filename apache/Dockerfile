## ---------------------------------------------------------------------------------------------------------------------
## APACHE ENVIRONMENT DOCKERFILE

FROM debian AS apache

RUN apt-get update && \
    apt-get install -y apt-utils apache2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod rewrite && \
    a2enmod remoteip && \
    a2enmod deflate && \
    a2enmod setenvif && \
    #a2enmod proxy && \
    a2enmod proxy_fcgi && \
    echo 'RemoteIPHeader X-Forwarded-For' >> /etc/apache2/apache2.conf && \
    echo 'LogFormat "%a %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined' >> /etc/apache2/apache2.conf

COPY apache/apache.conf /etc/apache2/sites-enabled/000-default.conf
COPY shared/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for.it.sh

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

WORKDIR /app
EXPOSE 80

COPY apache/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh"]