resource "tfe_registry_module" "virtual_network" {
  vcs_repo {
    # display_identifier = data.terraform_remote_state.github_repositories.outputs.module_azurerm_virtualnetwork_repo.full_name
    display_identifier = "terraform-azurerm-virtualnetwork"
    # identifier         = data.terraform_remote_state.github_repositories.outputs.module_azurerm_virtualnetwork_repo.full_name
    identifier         = "terraform-azurerm-virtualnetwork"
    oauth_token_id     = data.tfe_oauth_client.my_oauth_client.oauth_token_id
  }
}