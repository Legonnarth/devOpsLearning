.PHONY: verify create-cluster destroy-cluster

verify:
	@echo "Verifying environment..."
	@docker --version || (echo "Docker missing"; exit 1)
	@k3d --version || (echo "k3d missing"; exit 1)
	@kubectl version --client || (echo "kubectl missing"; exit 1)
	@helm version --short || (echo "helm missing"; exit 1)
	@terraform version || (echo "terraform missing"; exit 1)

create-cluster:
	@k3d cluster create dev-cluster --api-port 6443 -p '80:80@loadbalancer' -p '443:443@loadbalancer'

destroy-cluster:
	@k3d cluster delete dev-cluster || true
