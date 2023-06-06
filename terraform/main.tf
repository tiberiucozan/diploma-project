locals {
  region       = "LON1"
  tags         = "terraform"
  network_name = "default"
}

module "civo-argo-cluster" {
  source       = "github.com/nlamirault/terraform-civo-kubernetes?ref=v0.3.0"
  cluster_name = "ArgoCD-Cluster"
  node_count   = 2
  region       = local.region
  network_name = local.network_name

  tags = local.tags
}

module "civo-flux-cluster" {
  source       = "github.com/nlamirault/terraform-civo-kubernetes?ref=v0.3.0"
  cluster_name = "FLux-Cluster"
  node_count   = 2
  region       = local.region
  network_name = local.network_name

  tags = local.tags
}