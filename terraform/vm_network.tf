resource "azurerm_virtual_network" "network" {
  name                = "${var.prefix}network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}subnet-internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = ["10.0.2.0/24"]
}

# resource "azurerm_network_interface" "nic" {
#   name                = "unir-testbed-nic"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   ip_configuration {
#     name                          = "unir-testbed-nic-ip"
#     subnet_id                     = azurerm_subnet.subnet.id
#     private_ip_address_allocation = "Static"
#     private_ip_address            = "10.0.2.5"
#     public_ip_address_id          = azurerm_public_ip.pip.id
#   }
# }

# resource "azurerm_public_ip" "pip" {
#   name                    = "unir-testbed-pip"
#   location                = azurerm_resource_group.rg.location
#   resource_group_name     = azurerm_resource_group.rg.name
#   allocation_method       = "Dynamic"
# 	sku                     = "Basic"
#   idle_timeout_in_minutes = 30

#   tags = {
#     environment = "test"
#   }
# }

# data "azurerm_public_ip" "pip" {
#   name                = azurerm_public_ip.pip.name
#   resource_group_name = azurerm_linux_virtual_machine.vm.resource_group_name
# }