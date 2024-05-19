FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install mariadb-server -y && \
    apt install vim -y && \
    apt install sudo -y && \
    apt install systemctl -y 
    #ex +'30s/.*/bind-address = 0.0.0.0/' -cwq /etc/mysql/mariadb.conf.d/50-server.cnf
    # service mysql start


#  CMD /usr/bin/mysqld_safe

# createDb.sh is a script that create a database and a user 
#COPY ./conf/creatDb.sh /creatDb.sh

#ENTRYPOINT ["/bin/bash", "creatDb.sh"]; 
ENTRYPOINT [ "tail", "-f" ]
