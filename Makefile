include .env

export

.PHONY: up

set-envs :
	@if [ -z $(DOMAIN) ]; then \
		echo "DOMAIN must be set"; exit 10; \
	fi
	@if [ -z $(EMAIL) ]; then \
		echo "EMAIL must be set"; exit 10; \
	fi

validate :
	docker-compose config --quiet

build : validate set-envs
	docker-compose build

push :
		docker-compose push

up : set-envs
	docker-compose up -d

down :
	docker-compose down

tail :
	docker tail -f $(CONTAINER)

shell :
	docker exec -ti $(CONTAINER) /bin/bash

reset : set-envs down up
