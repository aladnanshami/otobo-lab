.PHONY: up down restart logs status health backup restore config clean

up:
	docker compose up -d

down:
	docker compose down

restart: down up

logs:
	docker compose logs -f --tail=100

status:
	docker compose ps

health:
	./scripts/healthcheck.sh

backup:
	./scripts/backup-db.sh

restore:
	./scripts/restore-db.sh

config:
	docker compose config

clean:
	docker compose down -v
