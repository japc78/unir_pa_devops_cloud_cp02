resource "azurerm_virtual_network" "network" {
  name                = "${var.prefix}vm-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = merge(
    var.default_tags,
    {
      name = "${var.prefix}vm-network"
    }
  )
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}vm-subnet-internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface_security_group_association" "nisg_association" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.network_sg.id
}