DOCKER_DIR="$$(pwd)"

# DOCKER implementation

docker: docker-up
docker-up:
	cd ${DOCKER_DIR} && docker-compose up -d

docker-down:
	cd ${DOCKER_DIR} && docker-compose down

.PHONY: docker docker-*
