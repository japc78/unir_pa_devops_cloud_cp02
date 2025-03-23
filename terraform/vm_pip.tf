resource "azurerm_public_ip" "vm_pip" {
  name                    = "${var.prefix}vm-pip"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name

  # The public IP is dynamically assigned.
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

# The resource data.azurerm_public_ip.pip retrieves this IP after its creation to display it as an output or use it in other resources.
data "azurerm_public_ip" "pip" {
  name                = azurerm_public_ip.vm_pip.name
  resource_group_name = azurerm_linux_virtual_machine.vm.resource_group_name
}