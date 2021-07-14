terraform {
  required_version = "~> 1.0"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.23.0"
    }
  }
}

provider "tfe" {
  token = var.tfe_org_token
}

provider "tfe" {
  alias = "module_registry"
  token = var.tfe_team_token
}