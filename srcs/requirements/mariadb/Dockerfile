FROM debian:bullseye

RUN apt update -y &&\
    apt upgrade -y && \
    apt install mariadb-server -y

    
COPY ./conf/creatDb.sh /

RUN chmod +x /creatDb.sh

EXPOSE 3306
    
ENTRYPOINT ["./creatDb.sh"]
 
