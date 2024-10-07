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