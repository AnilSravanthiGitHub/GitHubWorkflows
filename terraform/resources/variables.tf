variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  
}
variable "storage_account_name" {
  description = "Azure storage account name"
  type        = string
  
}
variable "container_name" {
  description = "Azure container name"
  type        = string
  
}
variable "key" {
  description = "Azure location"
  type        = string
  
}
variable "app_service_plan_name" {
  description = "Name of the App Service plan"
  type        = string
  
}
variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
  
}
variable "app_insights_name" {
  description = "The App Insights Name"
  type        = string
  default     = ""
}
variable "app_service_plan_tier" {
  description = "The Size of the App servcie plan - Basic, Standard, Premium"
  type        = string
  default     = "Standard"
} 
variable "app_service_plan_sku_size" {
  description = "The Service Tier S0, S1, S2, S3, P1, P2, P4, P6, P11 and ElasticPool"
  type        = string
  default     = "S1"
}
