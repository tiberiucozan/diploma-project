locals {
  region = "LON1"
}

module "civo-argo-cluster" {
  source       = "github.com/nlamirault/terraform-civo-kubernetes?ref=v0.3.0"
  cluster_name = "ArgoCD-Cluster"
  node_count   = 2
  region       = local.region
}

module "civo-flux-cluster" {
  source       = "github.com/nlamirault/terraform-civo-kubernetes?ref=v0.3.0"
  cluster_name = "FLux-Cluster"
  node_count   = 2
  region        = local.region
}