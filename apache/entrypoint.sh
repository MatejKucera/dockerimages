#!/bin/sh

bash /wait-for-it.sh $PHP_HOST:$PHP_PORT -t 300

/usr/sbin/apache2ctl -D FOREGROUND
