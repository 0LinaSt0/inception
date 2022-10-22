COMPOSE_FILE	=	./srcs/docker-compose.yml
MARIADB_LOCAL	=	/home/msalena/data/mariadb
WORDPRESS_LOCAL	=	/home/msalena/data/wordpress

all:
	mkdir -p $(WORDPRESS_LOCAL)
	mkdir -p $(MARIADB_LOCAL)
	cd ./srcs && sudo docker compose up --build

build:
	cd ./srcs && sudo docker compose build

stop_compose:
	sudo docker compose -f $(COMPOSE_FILE) stop

clean_images:
	sudo docker compose -f $(COMPOSE_FILE) down

clean_compose: 
	sudo rm -rf $(WORDPRESS_LOCAL)
	sudo rm -rf $(MARIADB_LOCAL)
	sudo docker system prune -a --volumes

clean_volumes:
	sudo docker volume rm $$(sudo docker volume ls -q)

fclean: clean_images clean_compose clean_volumes

.PHONY: stop_compose clean_images clean_compose clean_volumes fclean