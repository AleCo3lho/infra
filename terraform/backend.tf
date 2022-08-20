terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.2"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-coelhostuff-tfstate"
    storage_account_name = "coelhostufftfstate"
    container_name       = "tfstatedevops"
    key                  = "tfstateaks.tfstate"
  }
}
