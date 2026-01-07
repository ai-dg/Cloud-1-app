COMPOSE = srcs/docker-compose.yml
GREEN = "\033[32m"
RESET = "\033[0m"

up:
	docker compose -f $(COMPOSE) up -d --force-recreate

down:
	docker compose -f $(COMPOSE) down

downv:
	docker compose -f $(COMPOSE) down -v

save:
	./srcs/requirements/wordpress/tools/save.sh
	./srcs/requirements/mysql/tools/make-dump.sh

re:
	docker compose -f $(COMPOSE) down --rmi all --remove-orphans
	@echo ${GREEN}Images deleted${RESET}
	docker compose -f $(COMPOSE) up -d

clean:
	docker compose -f $(COMPOSE) down --rmi all --remove-orphans
	@echo ${GREEN}Images deleted${RESET}
	@docker builder prune --all --force
	@echo ${GREEN}Cache cleaned${RESET}
	@docker system df

logs:
	docker compose -f $(COMPOSE) logs wordpress
	docker compose -f $(COMPOSE) logs mysql
	docker compose -f $(COMPOSE) logs nginx

reset:
	docker compose -f $(COMPOSE) down -v
	docker compose -f $(COMPOSE) down --rmi all --remove-orphans

.PHONY: reset