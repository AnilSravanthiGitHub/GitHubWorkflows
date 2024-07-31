terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }
  backend "azurerm" {
        resource_group_name  = var.resource_group_name
        storage_account_name = var.storage_account_name
        container_name       = var.storage_container_name
        key                  = "terraform.tfstate"
    }
}
 
provider "azurerm" {
  features {}

  skip_provider_registration = "true"
}

resource "azurerm_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Windows"
  sku_name            = "P1v2"
}

resource "azurerm_app_service" "appsvc" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_service_plan.asp.id

  site_config {
    dotnet_framework_version = "v6.0"
  }

  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}

output "app_service_default_hostname" {
  value = azurerm_app_service.appsvc.default_site_hostname
}

