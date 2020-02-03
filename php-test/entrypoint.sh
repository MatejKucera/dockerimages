#!/bin/sh

php artisan migrate:fresh --force

php artisan pump

php artisan db:seed --force

cp -fv tests/data/database.db tests/data/default.db

phpunit
