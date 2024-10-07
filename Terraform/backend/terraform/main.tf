terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">=3.0.1"
  }
}
}

provider "azurerm" {
  subscription_id = var.subscriptio_id
  features { }
  
}

/*
resource "azurerm_resource_group" "rg" {
  name = var.prod_resource_group_name
  location = var.prod_location
}
*/
module "resource_group" {
  source = "./rg"
  subscriptio_id = var.subscriptio_id
  prod_resource_group_name = var.prod_resource_group_name
  prod_location = var.prod_location
}

module "vnet" {
source = "./vnet"
vnet_cidr = var.vnet_cidr
vnet_name = var.vnet_name
prod_resource_group_name = var.prod_resource_group_name
prod_location = var.prod_location
  
}