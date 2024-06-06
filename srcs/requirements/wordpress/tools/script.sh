#! /bin/bash 

# service php7.4-fpm start 

# curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \

# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# chmod +x /usr/local/bin/wp

# mv wp-cli.phar /usr/local/bin/wp

# cd /var/www/wordpress

# chmod -R 755 /var/www/wordpress/

# chown -R www-data:www-data /var/www/wordpress

# # check if mariadb container is up and running
# ping_mariadb_container() {
#     ping -c 1 mariadb > /dev/null # ping the mariadb container
#     return $? # return the exit status of the ping command
# }
# start_time=$(date +%s) # get the current time in seconds
# end_time=$((start_time + 20)) # set the end time to 20 seconds after the start time
# while [ $(date +%s) -lt $end_time ]; do # loop until the current time is greater than the end time
#     ping_mariadb_container # Ping the MariaDB container
#     if [ $? -eq 0 ]; then # Check if the ping was successful
#         echo "[========MARIADB IS UP AND RUNNING========]"
#         break # Exit the loop if MariaDB is up
#     else
#         echo "[========WAITING FOR MARIADB TO START...========]"
#         sleep 1 # Wait for 1 second before trying again
#     fi
# done

# if [ $(date +%s) -ge $end_time ]; then # check if the current time is greater than or equal to the end time
#     echo "[========MARIADB IS NOT RESPONDING========]"
# fi




# wp core download --path=/var/www/html --allow-root

# wp core config --dbhost=mariadb:3306 --dbname="$MYSQL_DB" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root

# wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_N" --admin_password="$WP_ADMIN_P" --admin_email="$WP_ADMIN_E" --allow-root

# wp user create "$WP_U_NAME" "$WP_U_EMAIL" --user_pass="$WP_U_PASS" --role="$WP_U_ROLE" --allow-root

# sed -i '36 s@/run/php/php7.4-fpm.sock@9000@' /etc/php/7.4/fpm/pool.d/www.conf



# mkdir -p /run/php

# php-fpm7.4 -F


sed -i -e 's/listen =.*/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# download core files
wp core download --path=/var/www/html --allow-root

# Create WordPress config file
wp config create --dbhost=mariadb --dbname=${MYSQL_DB_NAME} --dbuser=${MYSQL_USR} --dbpass=${MYSQL_PWD} --path=/var/www/html --allow-root --skip-check

# Install WordPress and create admin user
wp core install --url=${DOMAINE_NAME} --title="Wordpress page" --admin_name=${WP_USR} --admin_password=${WP_PWD} --admin_email="${ADMIN_EMAIL}"  --path=/var/www/html --allow-root

# create second user
wp user create "${USER}" "${USER_EMAIL}" --user_pass=${WP_PWD}  --allow-root --path=/var/www/html

# Start PHP-FPM
mkdir -p /run/php
php-fpm7.4 -F