resource "azurerm_dns_zone" "coelhostuff-tk" {
  name                = "coelhostuff.tk"
  resource_group_name = azurerm_resource_group.example.name
}