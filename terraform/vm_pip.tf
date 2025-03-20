resource "azurerm_public_ip" "vm_pip" {
  name                    = "${var.prefix}vm-pip"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  allocation_method       = "Dynamic"
	sku                     = "Basic"
  idle_timeout_in_minutes = 30
  domain_name_label       = "${var.prefix}vm-${var.vm_pip_dns_name}"

  tags = merge(
    var.default_tags,
    {
      name = "${var.prefix}vm-pip"
    }
  )
}

data "azurerm_public_ip" "pip" {
  name                = azurerm_public_ip.vm_pip.name
  resource_group_name = azurerm_linux_virtual_machine.vm.resource_group_name
}