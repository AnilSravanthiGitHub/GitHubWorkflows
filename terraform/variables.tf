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
