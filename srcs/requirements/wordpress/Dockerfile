FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \ 
    apt install php -y && \
    apt install php-fpm -y && \
    apt install php-mysql -y && \ 
    apt install php7.4-fpm -y && \
    apt install mariadb-client -y && \
    apt install curl -y && \
    apt install vim -y && \
    apt install iputils-ping -y

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
    && chmod +x /usr/local/bin/wp



COPY /tools/script.sh /

RUN chmod +x /script.sh

EXPOSE 9000

CMD ["./script.sh"]
# ENTRYPOINT [ "tail","-f" ]



#installing docker compose 
# 
# curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(Darwin-x86_64)-$(Darwin-x86_64)" -o /usr/local/bin/docker-compose