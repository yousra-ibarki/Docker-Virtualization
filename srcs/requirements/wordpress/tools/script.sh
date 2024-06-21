#! /bin/bash 

# until mysqladmin ping -h mariadb --silent; do
#     echo 'Waiting for MariaDB to be ready...'
#     sleep 5
# done
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp


chmod -R 755 /var/www/wordpress/

chown -R www-data:www-data /var/www/wordpress

cd /var/www/wordpress

wp core download --allow-root

wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DB" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root

mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php 

sed -i "s/'database_name_here'/'$MYSQL_DB'/g" /var/www/wordpress/wp-config.php
sed -i "s/'username_here'/'$MYSQL_USER'/g" /var/www/wordpress/wp-config.php
sed -i "s/'password_here'/'$MYSQL_PASSWORD'/g" /var/www/wordpress/wp-config.php
sed -i "s/'localhost'/'mariadb:3306'/g" /var/www/wordpress/wp-config.php

wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_N" --admin_password="$WP_ADMIN_P" --admin_email="$WP_ADMIN_E" --allow-root

wp user create "$WP_U_NAME" "$WP_U_EMAIL" --user_pass="$WP_U_PASS" --role="$WP_U_ROLE" --allow-root

sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf


mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F

