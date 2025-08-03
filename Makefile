build:
	docker compose up --build -d
up:
	docker compose up -d
down:
	docker compose down
down-v:
	docker compose down -v
shell:
	docker exec -it backend python manage.py shell_plus
makemigrations:
	docker exec -it backend python manage.py makemigrations
migrate:
	docker exec -it backend python manage.py migrate
superuser:
	docker exec -it backend python manage.py createsuperuser
psql:
	docker exec -it postgres \
  	bash -c "PGPASSWORD=$$POSTGRES_PASSWORD psql -U $$POSTGRES_USER -d $$POSTGRES_DB"
