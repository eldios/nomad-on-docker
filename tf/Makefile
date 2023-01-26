TF_DIR="$$(pwd)"

ifndef NOMAD_ADDR
NOMAD_ADDR?="http://$$(ip route | awk '/default/ {print $$9}'):4646"
endif

# utility targets

addr::
	@echo "Auto-detected Nomad IPv4 Addr: ${NOMAD_ADDR}"
	@echo "If wrong, please provide the correct one via NOMAD_ADDR env variable"

# Terraform implementation

tf: tf-up
tf-up:
	cd ${TF_DIR} && terraform init && \
	NOMAD_ADDR=${NOMAD_ADDR} terraform apply -auto-approve

tf-down:
	cd ${TF_DIR} && NOMAD_ADDR=${NOMAD_ADDR} terraform destroy -auto-approve

.PHONY: addr tf tf-*
