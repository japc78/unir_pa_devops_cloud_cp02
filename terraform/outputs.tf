# ACR
  output "acr_login_server" {
    description = "ACR login server URL"
    value       = azurerm_container_registry.acr.login_server
  }

  output "acr_admin_username" {
    description = "ACR administrator username"
    value       = azurerm_container_registry.acr.admin_username
    sensitive   = true
  }
  output "acr_admin_password" {
    description = "ACR administrator password"
    value       = azurerm_container_registry.acr.admin_password
    sensitive   = true
  }

# VM
  output "public_ip_address" {
    description = "Vm ip dinamic public address"
    value = azurerm_public_ip.pip.ip_address
  }

  output "dns_name" {
    description = "Vm dns name"
    value = azurerm_public_ip.pip.fqdn
  }

# AKS
  output "aks_kube_config" {
    description = "AKS .kube/config"
    value = azurerm_kubernetes_cluster.aks.kube_config_raw
    sensitive = true
  }

  output "aks_public_ip_address" {
    description = "Public ip for Ingress Controller"
    value = azurerm_public_ip.aks_pip.ip_address
  }

  output "aks_dns_name" {
    description = "DNS name of public IP"
    value = azurerm_public_ip.aks_pip.fqdn
  }

  output "azure_load_balancer_resource_group" {
    description = "Resource name where AKS load balancer is locate"
    value       = azurerm_kubernetes_cluster.aks.node_resource_group
  }