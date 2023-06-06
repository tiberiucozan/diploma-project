terraform {
  required_version = ">= 0.13"
  required_providers {
    civo = {
      source  = "civo/civo"
      version = ">= 1.0.7"
    }
  }
}

provider "civo" {
  token  = var.civo_token
  region = "FRA1"
}
