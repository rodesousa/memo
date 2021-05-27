NAME=pex

db:
	@docker run -id --name $(NAME)-db -e POSTGRES_PASSWORD=postgres -p 5432:5432 postgres:latest

