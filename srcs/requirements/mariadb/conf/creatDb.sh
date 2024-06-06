#!/bin/bash

service mariadb start 

sleep 5 


mariadb -e "CREATE DATABASE IF NOT EXISTS \`my_database\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`my_user\`@'%' IDENTIFIED BY 'my_password';"

mariadb -e "GRANT ALL PRIVILEGES ON my_database.* TO \`my_user\`@'%';"

mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root -pmy_root_password shutdown

mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
