#! /bin/bash 

apt install mariadb-server -y

service mariadb start 

sleep 5 


mariadb -e "CREATE DATABASE IF NOT EXISTS  "${DB_NAME}";"

mariadb -e "CREATE USER IF NOT EXISTS  "${USER_NAME}"@'%' IDENTIFIED BY  "${PWD}";"

mariadb -e "GRANT ALL PRIVILEGES ON my_database.* TO  "${USER_NAME}"@'%';"

mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root -pmy_root_password shutdown

mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
