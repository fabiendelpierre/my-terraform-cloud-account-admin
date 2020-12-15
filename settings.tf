terraform {
  required_version = "~> 0.14"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.23.0"
    }
  }
}

# Use TFE_TOKEN env variable in TF Cloud to configure provider
provider "tfe" {}