resource "tfe_registry_module" "virtual_network" {
  vcs_repo {
    display_identifier = data.terraform_remote_state.github_repositories.outputs.azure_msdn_subscription_repo.full_name
    identifier         = data.terraform_remote_state.github_repositories.outputs.azure_msdn_subscription_repo.full_name
    oauth_token_id     = data.tfe_oauth_client.my_oauth_client.oauth_token_id
  }
}