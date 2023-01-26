# default target for this Makefile
tf:     tf-up
.PHONY: tf

# Terraform implementation

# variables

TF_DIR="$$(pwd)"

ifndef NOMAD_ADDR
NOMAD_ADDR?="http://$$(ip route | awk '/default/ {print $$9}'):4646"
endif

# Terraform targets

tf-up:
	cd ${TF_DIR} && terraform init && \
	NOMAD_ADDR=${NOMAD_ADDR} terraform apply -auto-approve

tf-down:
	cd ${TF_DIR} && NOMAD_ADDR=${NOMAD_ADDR} terraform destroy -auto-approve

# utility targets

addr::
	@echo "Auto-detected Nomad IPv4 Addr: ${NOMAD_ADDR}"
	@echo "If wrong, please provide the correct one via NOMAD_ADDR env variable"

.PHONY: tf tf-up tf-down addr
