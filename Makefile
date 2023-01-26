DOCKER_DIR="$$(pwd)"
DOCKER_INFRA_DIR="${DOCKER_DIR}/infra"
DOCKER_TF_DIR="${DOCKER_DIR}/app"
SLEEP_TIME?=15
NOMAD_ADDR?=$$(ip route | awk '/default/ {print $$9}')

# standard targets
all: up
up: docker-up

clean: down
down: docker-down

# utility targets

addr:
	@echo "Auto-detected Nomad IPv4 Addr: ${NOMAD_ADDR}"
	@echo "If this is wrong, please provide the correct one via NOMAD_ADDR env variable"

sleep:
	@echo "sleeping ${SLEEP_TIME}s to let Nomad settle..."
	sleep ${SLEEP_TIME}s

# DOCKER implementation

docker: docker-up
docker-up: docker-infra-up sleep docker-tf-up
docker-down: docker-tf-down docker-infra-down

docker-infra-up:
	cd ${DOCKER_INFRA_DIR} && docker-compose up -d

docker-infra-down:
	cd ${DOCKER_INFRA_DIR} && docker-compose down

docker-tf-up:
	cd ${DOCKER_TF_DIR} && terraform init && terraform apply -auto-approve

docker-tf-down:
	cd ${DOCKER_TF_DIR} && terraform destroy -auto-approve

.PHONY: all clean up down addr sleep docker docker-*
