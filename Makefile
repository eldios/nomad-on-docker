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
NOMAD_ADDR?="http://$$(ip route | awk '/default/ {print $$9}'):4646"
endif

# default aliases

up:    docker-up sleep output

clean: down

down:  docker-down

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

output:
	@echo "Nomad should be ready and listening on ${NOMAD_ADDR}"

.PHONY: sleep addr output up clean down full full-up full-down
