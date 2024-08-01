terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }
  
}
provider "azurerm" {
  subscription_id = ${var.AZURE_SUBSCRIPTION_ID}
  tenant_id       = ${var.AZURE_TENANT_ID}
  use_oidc = true
  features {}
  skip_provider_registration = "true"
}

terraform {
  backend "azurerm" {
    resource_group_name  = ${var.resource_group_name}
    storage_account_name = ${var.storage_account_name}
    container_name       = ${var.container_name}
    key                  = "terraform.tfstate"
  }
}

data "azurerm_resource_group" "rg" {
  name                              = ${var.resource_group_name}
}

resource "azurerm_app_service_plan" "asp" {
  name                              = ${var.app_service_plan_name}
  resource_group_name               = data.azurerm_resource_group.rg.name
  location                          = data.azurerm_resource_group.rg.location  
 
  sku {    
    tier                            = ${var.app_service_plan_tier}
    size                            = ${var.app_service_plan_sku_size}
  }

}

resource "azurerm_application_insights" "ai" {
  name                              = ${var.app_insights_name}
  resource_group_name               = data.azurerm_resource_group.rg.name
  location                          = data.azurerm_resource_group.rg.location
  application_type                  = "web"

}

resource "azurerm_app_service" "as" {
  name                = ${var.app_service_name}
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  app_settings = {
    "APPINSIGHTS_INSTRUMENTATIONKEY" = azurerm_application_insights.ai.instrumentation_key
  }
}

