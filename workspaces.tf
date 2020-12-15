resource "tfe_workspace" "test" {
  name         = "my-workspace-name"
  organization = var.my_organization
}