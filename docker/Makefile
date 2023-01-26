DOCKER_DIR="$$(pwd)"

DOCKER_COMPOSE=$(shell which docker-compose 2> /dev/null || command -v docker-compose 2> /dev/null || docker compose 2> /dev/null || echo "not found")
ifeq ("not found", "${DOCKER_COMPOSE}")
  $(error `docker-compose` or `docker compose` not found)
endif

ifndef NOMAD_ADDR
NOMAD_ADDR?="http://$$(ip route | awk '/default/ {print $$9}'):4646"
endif

# utility targets

addr::
	@echo "Auto-detected Nomad IPv4 Addr: ${NOMAD_ADDR}"
	@echo "If wrong, please provide the correct one via NOMAD_ADDR env variable"

# Docker implementation

docker: docker-up
docker-up:
	cd ${DOCKER_DIR} && ${DOCKER_COMPOSE} up -d
	@echo "You should now be able to connect to Nomad at ${NOMAD_ADDR}"

docker-down:
	cd ${DOCKER_DIR} &&  ${DOCKER_COMPOSE} down

.PHONY: addr docker docker-*
