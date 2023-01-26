# Docker implementation
include docker/Makefile
DOCKER_DIR="$$(pwd)/docker"

# Terraform implementation
include tf/Makefile
TF_DIR="$$(pwd)/tf"

# default aliases
all:   up
up:    docker-up sleep output
clean: down
down:  docker-down

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

output:
	@echo "Nomad should be ready and listening on ${NOMAD_ADDR}"

# full workflow aliases
full:      full-up
full-up:   docker-up sleep tf-up output
full-down: tf-down sleep docker-down

.PHONY: sleep addr output all up clean down full full-*
