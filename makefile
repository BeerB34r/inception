DB_DIR	= /home/mde-beer/data/db
WP_DIR	= /home/mde-beer/data/website
RM		= rm -rf

all: up

up:
	mkdir -p $(DB_DIR)
	mkdir -p $(WP_DIR)
	docker compose --project-directory srcs up -d 

down:
	docker compose --project-directory srcs down --rmi local

clean:
	$(MAKE) down
	sudo $(RM) $(DB_DIR) $(WP_DIR)

re:
	$(MAKE) down
	$(MAKE) up
