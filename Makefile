DOCKER_DIR="$$(pwd)"
DOCKER_INFRA_DIR="${DOCKER_DIR}/infra"
DOCKER_TF_DIR="${DOCKER_DIR}/app"

SLEEP_TIME?=15
NOMAD_ADDR?=$$(ip route | awk '/default/ {print $$9}')

# standard targets
all: up
up: infra-up sleep tf-up

clean: down
down: tf-down infra-down

# utility targets

addr:
	@echo "Auto-detected Nomad IPv4 Addr: ${NOMAD_ADDR}"
	@echo "If this is wrong, please provide the correct one via NOMAD_ADDR env variable"

sleep:
	@echo "sleeping ${SLEEP_TIME}s to let Nomad settle..."
	sleep ${SLEEP_TIME}s

# DOCKER implementation

docker: docker-up
docker-up:
	cd ${DOCKER_INFRA_DIR} && docker-compose up -d

docker-down:
	cd ${DOCKER_INFRA_DIR} && docker-compose down

tf: tf-up
tf-up:
	cd ${DOCKER_TF_DIR} && terraform init && NOMAD_ADDR=${NOMAD_ADDR} terraform apply -auto-approve

tf-down:
	cd ${DOCKER_TF_DIR} && terraform NOMAD_ADDR=${NOMAD_ADDR} destroy -auto-approve

.PHONY: all clean up down addr sleep docker docker-* tf tf-*
