resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    git_commit           = "d68d2897add9bc2203a5ed0632a5cdd8ff8cefb0"
    git_file             = "terraform/azure/resource_group.tf"
    git_last_modified_at = "2020-06-16 14:46:24"
    git_last_modified_by = "nimrodkor@gmail.com"
    git_modifiers        = "nimrodkor"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "4b32188a-0baf-4570-adb1-5fe92b5e838d"
    yor_name             = "example"
  }
}