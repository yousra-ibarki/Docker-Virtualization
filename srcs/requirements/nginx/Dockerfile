FROM debian:bullseye

RUN apt update -y && \
    apt upgrade -y && \
    apt install nginx -y && \
    apt install vim -y && \
    apt install curl -y && \
    apt install openssl -y &&\
    apt install systemctl -y && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=MO/L=KH/O=1337/OU=student/CN=yoibarki.1337.ma"

# RUN chmod 755 /var/www/html && \
#     chmod -R www-data:www-data /var/www/html

COPY /conf/nginx.conf /etc/nginx/


CMD [ "nginx", "-g", "daemon off;" ]

#ENTRYPOINT [ "tail","-f" ]



                     