FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \ 
    apt install php-fpm php-mysql -y && \ 
    apt install curl -y && \
    apt install vim -y


ENTRYPOINT [ "tail","-f" ]
