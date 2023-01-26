DOCKER_DIR="$$(pwd)"

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
	cd ${DOCKER_DIR} && docker-compose up -d
	@echo "You should now be able to connect to Nomad at ${NOMAD_ADDR}"

docker-down:
	cd ${DOCKER_DIR} && docker-compose down

.PHONY: addr docker docker-*
