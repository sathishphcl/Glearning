# 1. Specify the version of the AzureRM Provider to use
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.0.1"
    }
    random = {
        source = "hashicorp/ransom"
        version = ">= 3.0"
    }
  }
}

resource "azurerm_resource_group" "rg" {
    name = "rg-name-1"
    location = "East US"
}

resource "random_string" "randomstr" {
  length = 16
}

resource "azurerm_storage_account" "mystacc-1" {
    account_replication_type = "LRS"
    location = azurerm_resource_group.rg.location
    account_tier = "Standard"
   name = "mysa${random_strig.randomstr.id}"
   resource_group_name =  azurerm_resource_group.rg.name
   tags = {
     stacc = "terraform-demo"
     
   }

  
}