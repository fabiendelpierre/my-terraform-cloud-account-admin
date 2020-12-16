resource "tfe_registry_module" "virtual_network" {
  name = "virtualnetwork"
  organization = var.my_tfc_organization
  module_provider = "github"

  vcs_repo {
    display_identifier = data.terraform_remote_state.github_repositories.outputs.module_azurerm_virtualnetwork_repo.full_name
    identifier         = data.terraform_remote_state.github_repositories.outputs.module_azurerm_virtualnetwork_repo.full_name
    oauth_token_id     = data.tfe_oauth_client.my_oauth_client.oauth_token_id
  }
}