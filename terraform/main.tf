locals {
  region = "LON1"
}

module "civo-argo-cluster" {
    source = "surajincloud/kubernetes/civo"
    cluster_name = "ArgoCD-Cluster"
}

module "civo-flux-cluster" {
    source = "surajincloud/kubernetes/civo"
    cluster_name = "FLux-Cluster"
}