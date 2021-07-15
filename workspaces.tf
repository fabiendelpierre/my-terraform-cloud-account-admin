resource "tfe_workspace" "azure_msdn_sandbox_infra" {
  name         = "my-azure-msdn-sandbox-infrastructure"
  organization = var.my_tfc_organization

  terraform_version = "1.0.2"

  vcs_repo {
    identifier = data.terraform_remote_state.github_repositories.outputs.azure_msdn_subscription_repo.full_name
    oauth_token_id = data.tfe_oauth_client.my_oauth_client.oauth_token_id
  }

  allow_destroy_plan  = true
  auto_apply          = true
}

resource "tfe_variable" "azure_msdn_subscription_azure_tenant_id" {
  key          = "ARM_TENANT_ID"
  value        = var.azure_tenant_id
  category     = "env"
  workspace_id = tfe_workspace.azure_msdn_sandbox_infra.id
  description  = "ID of my personal Azure tenant under MSDN subscription"
}

resource "tfe_variable" "azure_msdn_subscription_azure_subscription_id" {
  key          = "ARM_SUBSCRIPTION_ID"
  value        = var.azure_subscription_id
  category     = "env"
  workspace_id = tfe_workspace.azure_msdn_sandbox_infra.id
  description  = "ID of my personal Azure subscription under MSDN subscription"
}

resource "tfe_variable" "azure_msdn_subscription_azure_client_id" {
  key          = "ARM_CLIENT_ID"
  value        = var.azure_client_id
  category     = "env"
  workspace_id = tfe_workspace.azure_msdn_sandbox_infra.id
  description  = "Azure AD app reg client ID used to manage MSDN subscription"
}

resource "tfe_variable" "azure_msdn_subscription_azure_client_secret" {
  key          = "ARM_CLIENT_SECRET"
  value        = var.azure_client_secret
  category     = "env"
  workspace_id = tfe_workspace.azure_msdn_sandbox_infra.id
  description  = "Client secret tied to above Azure app reg"
  sensitive    = true
}

##########

resource "tfe_workspace" "azure_msdn_sandbox_ad" {
  name         = "my-azure-msdn-sandbox-ad-tenant"
  organization = var.my_tfc_organization

  terraform_version = "1.0.2"

  vcs_repo {
    identifier = "fabiendelpierre/my-azure-msdn-sandbox-ad-tenant"
    oauth_token_id = data.tfe_oauth_client.my_oauth_client.oauth_token_id
  }

  allow_destroy_plan  = true
  auto_apply          = false
}

resource "tfe_variable" "azure_msdn_azure_ad_tenant_id" {
  key          = "ARM_TENANT_ID"
  value        = var.azure_tenant_id
  category     = "env"
  workspace_id = tfe_workspace.azure_msdn_sandbox_ad.id
  description  = "ID of my personal Azure tenant under MSDN subscription"
}

resource "tfe_variable" "azure_msdn_azure_ad_client_id" {
  key          = "ARM_CLIENT_ID"
  value        = var.azure_ad_client_id
  category     = "env"
  workspace_id = tfe_workspace.azure_msdn_sandbox_ad.id
  description  = "Azure AD app reg client ID used to manage Azure AD tenant"
}

resource "tfe_variable" "azure_msdn_azure_ad_client_secret" {
  key          = "ARM_CLIENT_SECRET"
  value        = var.azure_ad_client_secret
  category     = "env"
  workspace_id = tfe_workspace.azure_msdn_sandbox_ad.id
  description  = "Client secret tied to above Azure app reg"
  sensitive    = true
}

##########

# resource "tfe_workspace" "vault_configuration" {
#   name         = "my-vault-cluster-configuration"
#   organization = var.my_tfc_organization

#   terraform_version = "0.14.4"

#   vcs_repo {
#     identifier = data.terraform_remote_state.github_repositories.outputs.vault_configuration_repo.full_name
#     oauth_token_id = data.tfe_oauth_client.my_oauth_client.oauth_token_id
#   }

#   allow_destroy_plan  = true
#   auto_apply          = false
# }