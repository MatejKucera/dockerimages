#!/bin/sh

if [ $USES_DB = "true" ]; then
  bash /wait-for-it.sh $DB_HOST:$DB_PORT -t 30
fi

if [ $USES_REDIS = "true" ]; then
  bash /wait-for-it.sh $REDIS_HOST:$REDIS_PORT -t 30
fi

if [ $USES_SONIC = "true" ]; then
  bash /wait-for-it.sh $SONIC_HOST:$SONIC_PORT -t 30
fi

# TODO this should be moved to dockerfile (but it didn't work, was problem with variable PHP_PORT)
sed -i "s/9000/$PHP_PORT/" /usr/local/etc/php-fpm.d/zz-docker.conf
sed -i "s/max_execution_time = 30/max_execution_time = $PHP_MAX_EXECUTION_TIME/" /usr/local/etc/php/php.ini-production
sed -i "s/max_execution_time = 30/max_execution_time = $PHP_MAX_EXECUTION_TIME/" /usr/local/etc/php/php.ini-development

php artisan migrate --force

php artisan pump

if [ $APP_ENV = "production" ]; then
  php artisan config:cache
  php artisan route:cache

  # create revision file
  REVCNT=$(git rev-list --all --count)
  echo $(($REVCNT + 147)) > /app/revision.txt

fi

docker-php-entrypoint

php-fpm
