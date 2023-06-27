locals {
  region       = "LON1"
  tags         = "terraform-created"
  network_name = "default"
}

# https://github.com/nlamirault/terraform-civo-kubernetes
module "civo-argo-cluster" {
  source       = "github.com/nlamirault/terraform-civo-kubernetes?ref=v0.3.0"
  cluster_name = "ArgoCD-Cluster"
  node_count   = 2
  region       = local.region
  network_name = local.network_name

  tags = local.tags
}

# https://github.com/nlamirault/terraform-civo-kubernetes
module "civo-flux-cluster" {
  source       = "github.com/nlamirault/terraform-civo-kubernetes?ref=v0.3.0"
  cluster_name = "FLux-Cluster"
  node_count   = 2
  region       = local.region
  network_name = local.network_name

  tags = local.tags
}

# Query small instance size
data "civo_instances_size" "small" {
    filter {
        key = "name"
        values = ["g3.small"]
        match_by = "re"
    }

    filter {
        key = "type"
        values = ["instance"]
    }

}

# Query instance disk image
data "civo_disk_image" "debian" {
   filter {
        key = "name"
        values = ["debian-10"]
   }
}

# Create a new instance
resource "civo_instance" "grafana" {
    tags = ["grafana"]
    notes = "Grafana Instance"
    size = element(data.civo_instances_size.small.sizes, 0).name
    disk_image = element(data.civo_disk_image.debian.diskimages, 0).id
}