resource azurerm_kubernetes_cluster "k8s_cluster" {
  dns_prefix          = "terragoat-${var.environment}"
  location            = var.location
  name                = "terragoat-aks-${var.environment}"
  resource_group_name = azurerm_resource_group.example.name
  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = "default"
    vm_size    = "Standard_D2_v2"
    node_count = 2
  }
  addon_profile {
    oms_agent {
      enabled = false
    }
    kube_dashboard {
      enabled = true
    }
  }
  role_based_access_control {
    enabled = false
  }
  tags = {
    git_commit           = "1e016b3b6cc03c4d399eb3adb73ea6f5d80eaeff"
    git_file             = "terraform/azure/aks.tf"
    git_last_modified_at = "2022-02-11 19:50:50"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente/nimrodkor"
    git_org              = "rbenavente"
    git_repo             = "terragoat"
    yor_trace            = "dd783daa-8fcf-419f-8aa1-bf772da74086"
  }
}
