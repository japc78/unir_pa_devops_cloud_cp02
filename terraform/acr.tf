resource "azurerm_container_registry" "acr" {
  name                = "${replace(var.prefix, "-", "")}acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.acr_sku
	admin_enabled       = var.acr_admin_enable

  tags = merge(
      var.default_tags,
      {
        name = "${var.prefix}acr"
      }
    )
}