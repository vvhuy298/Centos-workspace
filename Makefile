start:
	docker-compose up --buil -d
restart:
	docker-compose up -d
stop:
	docker-compose down
exec:
	docker-compose exec os bash