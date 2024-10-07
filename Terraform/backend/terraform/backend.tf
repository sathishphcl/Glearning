terraform {
backend "azurerm" {
storage_account_name = "tfbackendstacc8148"
resource_group_name  = "rg-tfbackend-8148"
container_name = "tfstate"
key = "terraform.tfstate"
}
}
