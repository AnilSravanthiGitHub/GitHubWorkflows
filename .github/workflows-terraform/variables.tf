variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = var.resource_group_name
}

variable "location" {
  description = "Azure location"
  type        = string
  default     =  var.location
}

variable "app_service_plan_name" {
  description = "Name of the App Service plan"
  type        = string
  default     = var.app_service_plan_name
}

variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
  default     = var.app_service_name
}
