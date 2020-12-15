terraform {
  required_version = "~> 0.14"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.23.0"
    }
  }
}

provider "tfe" {}