resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}vm-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.prefix}vm-nic-ip"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.2.5"
    public_ip_address_id          = azurerm_public_ip.pip.id
  }

  tags = merge(
    var.default_tags,
    {
      name = "${var.prefix}vm-nic"
    }
  )
}