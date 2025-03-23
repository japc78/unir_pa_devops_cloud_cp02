resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.prefix}aks"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  dns_prefix          = "${var.prefix}aks-japc"

  default_node_pool {
    name       = var.aks_node_pool_name
    node_count = var.aks_node_pool_node_count
    vm_size    = var.aks_node_pool_node_vm_size
  }

  identity {
    type = var.aks_identity_type
  }


  tags = merge(
    var.default_tags,
    {
      name = "${var.prefix}aks"
    }
  )
}

# Grants AKS cluster permissions to interact with ACR, allowing nodes to pull container images.
# Uses the kubelet_identity's object_id as the principal, enabling AKS to deploy containers from the registry.
# This connection is essential for AKS to access and deploy images stored in ACR.
resource "azurerm_role_assignment" "ra-perm" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = var.aks_role_assignment_acr
  scope                = azurerm_container_registry.acr.id
}

