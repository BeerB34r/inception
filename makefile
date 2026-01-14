all: up

up:;	docker compose --project-directory srcs up -d 

down:;	docker compose --project-directory srcs down

