#! /bin/bash 

# service php7.4-fpm start 

wp core download --path=/var/www/html --allow-root

mkdir -p /run/php
php-fpm7.4 -F