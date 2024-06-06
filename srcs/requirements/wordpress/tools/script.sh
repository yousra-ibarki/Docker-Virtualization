#! /bin/bash 

sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

wp core download --path=/var/www/html --allow-root

wp config create --dbhost=mariadb --dbname=${DB_NAME} --dbuser=${MYSQL_USR} --dbpass=${MYSQL_PWD} --path=/var/www/html --allow-root --skip-check

wp core install --url=${DOMAINE_NAME} --title="Wordpress page" --admin_name=${WP_USR} --admin_password=${WP_PWD} --admin_email="${ADMIN_EMAIL}"  --path=/var/www/html --allow-root

wp user create "${USER}" "${USER_EMAIL}" --user_pass=${WP_PWD}  --allow-root --path=/var/www/html

mkdir -p /run/php
php-fpm7.4 -F