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

# RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
#     && chmod +x /usr/local/bin/wp

# RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# RUN		chown -R root:root /var/www/wordpress

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# RUN chmod +x wp-cli.phar
# RUN mv wp-cli.phar /usr/local/bin/wp
					

COPY /tools/script.sh /

RUN chmod +x script.sh

EXPOSE 9000

CMD ["./script.sh"]
# ENTRYPOINT [ "tail","-f" ]



#installing docker compose 
# 
# curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(Darwin-x86_64)-$(Darwin-x86_64)" -o /usr/local/bin/docker-compose