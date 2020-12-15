data "tfe_oauth_client" "my_oauth_client" {
  oauth_client_id = var.oauth_client_id
}

data "terraform_remote_state" "github_repositories" {
  backend = "remote"
  config = {
    organization = var.my_tfc_organization
    workspaces = {
      name = var.my_tfc_github_workspace
    }
  }
}