FROM debian:bullseye

RUN apt update -y &&\
    apt upgrade -y && \
    apt install mariadb-server -y

    
COPY ./conf/createDb.sh /

RUN chmod +x /createDb.sh

EXPOSE 3306
    
ENTRYPOINT ["./createDb.sh"]
 
