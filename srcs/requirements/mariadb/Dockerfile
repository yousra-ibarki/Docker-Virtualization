FROM debian:buster

RUN apt update -y && \
    apt upgrade -y && \
    apt install mariadb-server -y && \
    apt install vim -y && \
    ex +'28s/.*/bind-address = 0.0.0.0/' -cwq /etc/mysql/mariadb.conf.d/50-server.cnf && \
    service mysql start


CMD /usr/bin/mysqld_safe
#ENTRYPOINT [ "tail","-f" ]
