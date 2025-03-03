DB_DATA = /home/yoibarki/data/mariadb
WP_DATA = /home/yoibarki/data/wordpress

all : up

up : build
	@mkdir -p $(DB_DATA)
	@mkdir -p $(WP_DATA)
	docker compose -f ./srcs/docker-compose.yml up -d

down : 
	docker compose -f ./srcs/docker-compose.yml down

stop : 
	docker compose -f ./srcs/docker-compose.yml stop

start : 
	docker compose -f ./srcs/docker-compose.yml start

build :
	docker compose -f ./srcs/docker-compose.yml build 

status : 
	docker ps
