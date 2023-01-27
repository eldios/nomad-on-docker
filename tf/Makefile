# default target for this Makefile
tf:     tf-up
.PHONY: tf

# Terraform implementation

# variables

TF_DIR="$$(pwd)"

ifndef HOST_ADDR
HOST_ADDR?="$$(ip route | awk '/default/ {print $$9}')"
endif

NOMAD_ADDR?="http://${HOST_ADDR}:4646"

# Terraform targets

tf-up:
	cd ${TF_DIR} && terraform init && \
	NOMAD_ADDR=${NOMAD_ADDR} terraform apply -auto-approve

tf-down:
	cd ${TF_DIR} && terraform init && \
	NOMAD_ADDR=${NOMAD_ADDR} terraform destroy -auto-approve

# utility targets

addr::
	@echo "Auto-detected Nomad IPv4 Addr: ${NOMAD_ADDR}"
	@echo "If wrong, please provide the correct IPv4 one via HOST_ADDR env variable"

.PHONY: tf tf-up tf-down addr
