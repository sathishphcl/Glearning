resource "azurerm_virtual_network" "vnet" {
    address_space = [ var.vnet_cidr ]
    location = var.prod_location
    name = var.vnet_name
    resource_group_name = var.prod_resource_group_name

 
}