variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  
}

variable "location" {
  description = "Azure location"
  type        = string
  
}

variable "storage_account_name" {
    type    = string
}

variable "backend_resource_group_name" {
  description = "The name of the resource group where the backend storage account is located."
  type        = string
}

variable "backend_storage_account_name" {
  description = "The name of the backend storage account."
  type        = string
}
variable "backend_container_name" {
  description = "The name of the container in the backend storage account."
  type        = string
}

variable "storage_container_name" {
    type    = string
}

variable "app_service_plan_name" {
  description = "Name of the App Service plan"
  type        = string
  
}

variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
  
}

