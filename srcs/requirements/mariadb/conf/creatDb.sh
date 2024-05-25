#!/bin/bash

#db_name = Database Name
#db_user = User
#db_pwd = User Password

# echo "CREATE DATABASE IF NOT EXISTS wordpress ;" > db1.sql
# echo "CREATE USER IF NOT EXISTS 'yoibarki'@'%' IDENTIFIED BY '1337' ;" >> db1.sql
# echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'yoibarki'@'%' ;" >> db1.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
# echo "FLUSH PRIVILEGES;" >> db1.sql

# mysql < db1.sql

# /usr/bin/mysqld_safe

#!/bin/bash

#!/bin/bash

service mariadb start 
sleep 5 


mariadb -e "CREATE DATABASE IF NOT EXISTS \`my_database\`;"

mariadb -e "CREATE USER IF NOT EXISTS \`my_user\`@'%' IDENTIFIED BY 'my_password';"

mariadb -e "GRANT ALL PRIVILEGES ON my_database.* TO \`my_user\`@'%';"

mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root -pmy_root_password shutdown

mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
