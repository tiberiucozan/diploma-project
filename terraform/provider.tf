terraform {
  required_providers {
    civo = {
      source = "civo/civo"
      version = "0.10.5"
    }
  }
}

provider "civo" {
  token = var.civo_token
}
