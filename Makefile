# Docker implementation
include docker/Makefile
DOCKER_DIR="$$(pwd)/docker"

# Terraform implementation
include tf/Makefile
TF_DIR="$$(pwd)/tf"

# utility targets

ifndef SLEEP_TIME
SLEEP_TIME?=15
endif
sleep:
	@echo "sleeping ${SLEEP_TIME}s to let Nomad settle..."
	sleep ${SLEEP_TIME}s

ifndef NOMAD_ADDR
NOMAD_ADDR?="http://$$(ip route | awk '/default/ {print $$9}'):4646"
endif
addr::
	@echo "Auto-detected Nomad IPv4 Addr: ${NOMAD_ADDR}"
	@echo "If wrong, please provide the correct one via NOMAD_ADDR env variable"

# default aliases
all:   up
up:    docker-up
clean: down
down:  docker-down

output:
	@echo "Nomad should be listening on ${NOMAD_ADDR}"

full:      docker-up sleep tf-up
full-up:   docker-up sleep tf-up
full-down: tf-down docker-down

.PHONY: all up clean down full full-* output sleep addr
