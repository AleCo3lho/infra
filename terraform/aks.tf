resource "azurerm_resource_group" "rg" {
  name     = "rg-coelhostuff-dev-004"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-coelhostuff-dev-004"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akscoelhostuffdev004"
  kubernetes_version  = "1.22.6"


  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_B2s"
    max_pods   = 240
    os_sku     = "Ubuntu"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Development"
  }
}

resource "azurerm_role_assignment" "ara" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}