#! /bin/bash 

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar

mv wp-cli.phar /usr/local/bin/wp

cd /var/www/wordpress

chmod -R 755 /var/www/wordpress/

chown -R www-data:www-data /var/www/wordpress

wp core download --allow-root

wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DB" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root

wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_N" --admin_password="$WP_ADMIN_P" --admin_email="$WP_ADMIN_E" --allow-root

wp user create "$WP_U_NAME" "$WP_U_EMAIL" --user_pass="$WP_U_PASS" --role="$WP_U_ROLE" --allow-root

sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf


mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F


# sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# wp core download --path=/var/www/html --allow-root

# wp config create --dbhost=mariadb --dbname="${MYSQL_DATABASE}" --dbuser="${MYSQL_USER}" --dbpass="${MYSQL_PASSWORD}" --path=/var/www/html --allow-root --skip-check

# wp core install --url="${DOMAINE_NAME}" --title="Wordpress page" --admin_name="${WORDPRESS_DB_USER}" --admin_password="${WORDPRESS_DB_PASSWORD}" --admin_email="${ADMIN_EMAIL}"  --path=/var/www/html --allow-root

# wp user create "${USER}" "${USER_EMAIL}" --user_pass=${WORDPRESS_DB_PASSWORD}  --allow-root --path=/var/www/html

# mkdir -p /run/php
# php-fpm7.4 -F