terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.18" # use a recent version
    }
  }
}
provider "kubernetes" {
  config_path = "~/.kube/config"
}
resource "kubernetes_deployment" "nginx" {
  metadata {
    name   = "tf-nginx-deployment"
    labels = { app = "tf-nginx" }
  }
  spec {
    replicas = 2
    selector {
      match_labels = { app = "tf-nginx" }
    }
    template {
      metadata {
        labels = { app = "tf-nginx" }
      }
      spec {
        container {
          name  = "nginx"
          image = "nginx:1.21.6"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name = "tf-nginx-service"
  }
  spec {
    type = "LoadBalancer"
    selector = {
      app = kubernetes_deployment.nginx.spec.0.template.0.metadata.0.labels.app
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}

