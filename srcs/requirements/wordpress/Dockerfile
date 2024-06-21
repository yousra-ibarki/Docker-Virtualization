FROM debian:bullseye

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install wget -y && \
    apt-get install curl -y && \
    apt-get install php-fpm -y && \
    apt-get install php7.4-fpm -y && \
    apt-get install php-mysql -y && \
    apt-get install mariadb-client -y && \
    apt install iputils-ping -y
				

COPY /tools/script.sh /

RUN chmod +x script.sh

EXPOSE 9000

CMD ["./script.sh"]
