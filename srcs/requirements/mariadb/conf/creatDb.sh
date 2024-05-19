#!/bin/bash

service mysql start 


exec "$@"


#SCRIPT NUMBER 1
# This line starts the MySQL service.
service mysql start 

# This line creates a MySQL database with the name stored in the environment variable $MYSQL_DB_NAME, if it does not already exist.
echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_DB_NAME};" | mysql

# This line creates a MySQL user with the name and password stored in the environment variables $MYSQL_USR and $MYSQL_PWD,respectively. The user is created with the ability to log in from any host ('%').
echo "CREATE USER IF NOT EXISTS '$MYSQL_USR'@'%' IDENTIFIED BY '$MYSQL_PWD';" | mysql

# This line grants all privileges on the database created in the first step to the user created in the second step.
echo "GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USR'@'%' ;" | mysql

# This line changes the password of the MySQL root user to the one stored in the environment variable $MYSQL_ROOT_PWD.
echo "ALTER USER '$MYSQL_ROOT_USR'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';" | mysql

# This line reloads the MySQL privilege tables to ensure that the changes made in the previous steps take effect.
echo "FLUSH PRIVILEGES;" | mysql

# This line kills the MySQL process that is currently running, using the PID (process ID) stored in the file /var/run/mysqld/mysqld.pid.
kill $(cat /var/run/mysqld/mysqld.pid)

# This line starts the MySQL server in a safe mode, which can help diagnose and fix startup problems.
mysqld_safe

#SCRIPT NUMBER 2
#db_name = Database Name
#db_user = User
#db_pwd = User Password

echo "CREATE DATABASE IF NOT EXISTS $DATABASE1 ;" > db1.sql
echo "CREATE USER IF NOT EXISTS '$Yoibarki'@'%' IDENTIFIED BY '$db_pwd' ;" >> db1.sql
echo "GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%' ;" >> db1.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
echo "FLUSH PRIVILEGES;" >> db1.sql

mysql < db1.sql