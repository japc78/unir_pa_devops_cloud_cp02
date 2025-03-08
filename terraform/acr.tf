resource "azurerm_container_registry" "acr" {
  name                = "unirpadevopscp2acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Basic"
	admin_enabled       = true

  tags = {
    name = "cp2-acr"
  	environment = "cp2"
    owner = "japc.dev@gmail.com"
    project = "Unir-PA-Devops-cp2"
  }
}