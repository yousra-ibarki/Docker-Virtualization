FROM debian:bullseye

RUN apt update -y &&\
    apt upgrade -y && \
    apt install mariadb-server -y
    # apt install vim -y && \
    # apt install mariadb-server -y
    
    # RUN ex +'30s/.*/bind-address = 0.0.0.0/' -cwq /etc/mysql/mariadb.conf.d/50-server.cnf
    
    
COPY ./conf/creatDb.sh /

RUN chmod +x /creatDb.sh

EXPOSE 3306
    
ENTRYPOINT ["./creatDb.sh"]
 


#/var/lib/mysql/aria_log_control' 
