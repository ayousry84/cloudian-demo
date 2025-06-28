# Makefile to simplify devops workflow

up:
	docker compose up -d --build
	bash post_up.sh

down:
	docker compose down

rebuild:
	docker compose down
	docker compose up -d --build
	bash post_up.sh

logs:
	docker compose logs -f

ssh-master:
	ssh root@localhost -p 2222