provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-se-webapp-dev"
  location = "West Europe"
}

resource "azurerm_storage_account" "sa" {
  name                     = "stterraformbackend"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "stg_container" {
  name                  = "terraform-state"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

output "storage_account_name" {
  value = azurerm_storage_account.stg.name
}

output "container_name" {
  value = azurerm_storage_container.container.name
}

output "storage_account_key" {
  value = azurerm_storage_account.stg.primary_access_key
  sensitive = true
}

