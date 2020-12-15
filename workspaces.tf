resource "tfe_workspace" "azure_msdn_subscription" {
  name         = "my-azure-msdn-subscription"
  organization = var.my_tfc_organization

  terraform_version = "0.14.2"

  vcs_repo {
    identifier = data.terraform_remote_state.github_repositories.outputs.azure_msdn_subscription_repo.full_name
    oauth_token_id = data.tfe_oauth_client.my_oauth_client.oauth_token_id
  }

  allow_destroy_plan  = true
  auto_apply          = false
}

resource "tfe_workspace" "vault_configuration" {
  name         = "my-vault-cluster-configuration"
  organization = var.my_tfc_organization

  terraform_version = "0.14.2"

  vcs_repo {
    identifier = data.terraform_remote_state.github_repositories.outputs.vault_configuration_repo.full_name
    oauth_token_id = data.tfe_oauth_client.my_oauth_client.oauth_token_id
  }

  allow_destroy_plan  = true
  auto_apply          = false
}