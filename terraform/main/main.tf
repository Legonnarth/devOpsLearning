terraform {
  required_providers {
    null = { source = "hashicorp/null" }
  }
}
provider "null" {}

resource "null_resource" "create_k3d" {
  provisioner "local-exec" {
    command = "k3d cluster create dev-cluster --api-port 6443 -p '80:80@loadbalancer' -p '443:443@loadbalancer'"
  }
}

