all:    up
.PHONY: all

# Docker implementation
include docker/Makefile
DOCKER_DIR="$$(pwd)/docker"

# Terraform implementation
include tf/Makefile
TF_DIR="$$(pwd)/tf"

# variables
ifndef SLEEP_TIME
SLEEP_TIME?=15
endif

ifndef NOMAD_ADDR
IPv4_ADDR?="$$(ip route | awk '/default/ {print $$9}')"
NOMAD_ADDR?="http://${IPv4_ADDR}:4646"
INGRESS_ADDR?="http://${IPv4_ADDR}"
TRAEFIK_ADMIN_ADDR?="http://${IPv4_ADDR}:8080"
endif

# default aliases

up:    docker-up sleep docker-output

clean: down

down:  tf-down sleep docker-down

# full workflow aliases

full:      docker-up sleep tf-up output
full-up:   docker-up sleep tf-up output

full-down: tf-down sleep docker-down

# utility targets

sleep:
	@echo "sleeping ${SLEEP_TIME}s to let Nomad settle..."
	sleep ${SLEEP_TIME}s

addr::
	@echo "Auto-detected Nomad IPv4 Addr: ${NOMAD_ADDR}"
	@echo "If wrong, please provide the correct one via NOMAD_ADDR env variable"

docker-output:
	@echo "Nomad Dashboard   should be listening on ${NOMAD_ADDR}"

output: full-output
full-output:
	@echo "Nomad Dashboard   should be listening on ${NOMAD_ADDR}"
	@echo "Traefik Ingress   should be listening on ${INGRESS_ADDR}"
	@echo "Traefik Dashboard should be listening on ${TRAEFIK_ADMIN_ADDR}"

.PHONY: sleep addr output full-output docker-output up clean down full full-up full-down
