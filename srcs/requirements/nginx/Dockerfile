#FROM	debian:buster
FROM	debian:bullseye

RUN		apt-get update
RUN		apt-get install -y nginx \
                openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/ssl/certs/nginx-selfsigned.crt \
       -keyout /etc/ssl/private/nginx-selfsigned.key \
       -subj "/C=MO/L=KH/O=1337/OU=Student/CN=yoibarki/"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]



