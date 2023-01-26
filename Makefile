# Docker implementation
include docker/Makefile
DOCKER_DIR="$$(pwd)/docker"

# Terraform implementation
include tf/Makefile
TF_DIR="$$(pwd)/tf"

# utility targets

SLEEP_TIME?=15
sleep:
	@echo "sleeping ${SLEEP_TIME}s to let Nomad settle..."
	sleep ${SLEEP_TIME}s

# default aliases
all:   up
up:    docker-up
clean: down
down:  docker-down

full-up:   docker-up sleep tf-up
full-down: tf-down docker-down

.PHONY: all up clean down full
