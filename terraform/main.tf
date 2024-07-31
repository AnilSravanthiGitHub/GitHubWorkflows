terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.7.0"
    }
  }
}
 
provider "azurerm" {
  features {}

  skip_provider_registration = "true"
}

resource "azurerm_resource_group" "resgrp" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_app_service_plan" "asp" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.resgrp.location
  resource_group_name = azurerm_resource_group.resgrp.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "appsvc" {
  name                = var.app_service_name
  location            = azurerm_resource_group.resgrp.location
  resource_group_name = azurerm_resource_group.resgrp.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

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

