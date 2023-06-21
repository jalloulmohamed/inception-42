up:
	mkdir -p /home/mjalloul/data/wordpress/
	mkdir -p /home/mjalloul/data/mariadb/
	cd srcs && docker-compose up --build  -d

run:
	cd srcs && docker-compose up  
down:
	cd srcs && docker-compose down -v

fclean: down
	cd srcs && docker system prune -a -f
	sudo rm -rf /home/mjalloul/data/wordpress/*
	sudo rm -rf /home/mjalloul/data/mariadb/*

re: fclean up