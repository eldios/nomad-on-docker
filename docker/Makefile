docker: docker-up
.PHONY: docker

# Docker implementation

# variables

DOCKER_DIR="$$(pwd)"

DOCKER_COMPOSE=$(shell which docker-compose 2> /dev/null || command -v docker-compose 2> /dev/null || docker compose 2> /dev/null || echo "not found")
ifeq ("not found", "${DOCKER_COMPOSE}")
  $(error `docker-compose` or `docker compose` not found)
endif

# Docker targets

docker-up:
	cd ${DOCKER_DIR} && ${DOCKER_COMPOSE} up -d

docker-down:
	cd ${DOCKER_DIR} && ${DOCKER_COMPOSE} down -v

.PHONY: docker-up docker-down
