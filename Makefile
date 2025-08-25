SRC_DIR = srcs

up:
	cd $(SRC_DIR) && docker-compose up -d

down:
	cd $(SRC_DIR) && docker-compose down

build:
	cd $(SRC_DIR) && docker-compose build

re: down build up

logs:
	cd $(SRC_DIR) && docker-compose logs -f

ps:
	cd $(SRC_DIR) && docker-compose ps

clean:
	cd $(SRC_DIR) && docker-compose down -v --remove-orphans

