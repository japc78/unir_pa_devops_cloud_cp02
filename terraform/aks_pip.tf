resource "azurerm_public_ip" "aks_pip" {
  name                    = "${var.prefix}aks-pip"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_kubernetes_cluster.aks.node_resource_group
  allocation_method       = "Static"
  sku                     = "Standard"
  domain_name_label       = "${var.prefix}aks-japc"

  tags = merge(
    var.default_tags,
    {
      name = "${var.prefix}aks-pip"
    }
  )

# Dependencia explícita para asegurar que el clúster se crea primero y se puede asignar el rg del nodo
  depends_on = [azurerm_kubernetes_cluster.aks]
}