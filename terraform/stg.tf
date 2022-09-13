/* resource "azurerm_storage_account" "kubecost" {
  name                     = "akskubecost"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Development"
  }
}

resource "azurerm_storage_container" "kubecost" {
  name                  = "kubecost"
  storage_account_name  = azurerm_storage_account.kubecost.name
  container_access_type = "private"
} */