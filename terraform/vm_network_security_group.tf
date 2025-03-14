resource "azurerm_network_security_group" "network_sg" {
  name                = "${var.prefix}vm-network-sg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  tags = merge(
    var.default_tags,
    {
      name = "${var.prefix}vm-network-sg"
    }
  )
}