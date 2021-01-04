resource "tfe_registry_module" "virtual_network" {
  provider = tfe.module_registry
  vcs_repo {
    display_identifier = data.terraform_remote_state.github_repositories.outputs.module_azurerm_virtualnetwork_repo.full_name
    identifier         = data.terraform_remote_state.github_repositories.outputs.module_azurerm_virtualnetwork_repo.full_name
    oauth_token_id     = data.tfe_oauth_client.my_oauth_client.oauth_token_id
  }
}

resource "tfe_registry_module" "key_vault" {
  provider = tfe.module_registry
  vcs_repo {
    display_identifier = data.terraform_remote_state.github_repositories.outputs.module_azurerm_keyvault_repo.full_name
    identifier         = data.terraform_remote_state.github_repositories.outputs.module_azurerm_keyvault_repo.full_name
    oauth_token_id     = data.tfe_oauth_client.my_oauth_client.oauth_token_id
  }
}