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

resource "azurerm_storage_account" "terraform_backend" {
    name                = var.storage_account_name
    resource_group_name = azurerm_resource_group.resgrp.name
    location            = azurerm_resource_group.resgrp.location
    account_tier        = var.storage_account_tier
    account_replication_type = var.storage_account_replication_type
    allow_blob_public_access = true
}

resource "azurerm_storage_container" "terraform_backend" {
  name                  = var.storage_container_name 
  storage_account_name  = azurerm_storage_account.terraform_backend.name
  container_access_type = var.container_access_type
}