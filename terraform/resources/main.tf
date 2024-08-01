terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }
  
}
provider "azurerm" { 
  use_oidc = true
  features {}
  skip_provider_registration = "true"
}

data "azurerm_resource_group" "rg" {
  name                              = var.resource_group_name
}

resource "azurerm_service_plan" "asp" {
  name                              = var.app_service_plan_name
  resource_group_name               = data.azurerm_resource_group.rg.name
  location                          = data.azurerm_resource_group.rg.location  
  sku_name                          = var.app_service_plan_sku_size
  os_type                           = "Windows" 

}

resource "azurerm_application_insights" "ai" {
  name                              = var.app_insights_name
  resource_group_name               = data.azurerm_resource_group.rg.name
  location                          = data.azurerm_resource_group.rg.location
  application_type                  = "web"

}

resource "azurerm_app_service" "as" {
  name                = var.app_service_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.asp.id

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.ai.instrumentation_key
  }
}
