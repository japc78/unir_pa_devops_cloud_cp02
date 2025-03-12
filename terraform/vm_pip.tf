resource "azurerm_public_ip" "pip" {
  name                    = "${var.prefix}pip"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  allocation_method       = "Dynamic"
	sku                     = "Basic"
  idle_timeout_in_minutes = 30

  tags = {
    environment = "test"
  }
}

data "azurerm_public_ip" "pip" {
  name                = azurerm_public_ip.pip.name
  resource_group_name = azurerm_linux_virtual_machine.vm.resource_group_name
}