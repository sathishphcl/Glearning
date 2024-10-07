/*
# variables.tf
variable "storage_account_name" {
  description = "The name of the Azure Storage Account"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group"
  type        = string
}

variable "storage_container_name" {
  description = "The name of the Resource Group"
  type        = string
}

*/

variable "prod_resource_group_name" {
  description = "The name of the Resource Group for Production"
  type        = string
  #default = "avd-rg"
}

variable "prod_location" {
  description = "The production location for resources"
  type        = string
  #default     = "East US"  # Optional: you can set a default value
}

variable "subscriptio_id" {
  description = "The production Subscription for resources"
  type        = string
  #default     = "East US"  # Optional: you can set a default value
}