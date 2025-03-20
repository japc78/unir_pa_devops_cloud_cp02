# ACR
  output "acr_login_server" {
    description = "The URL of the login server for the Azure Container Registry, used to authenticate and push/pull container images."
    value       = azurerm_container_registry.acr.login_server
  }

  output "acr_admin_username" {
    description = "The administrator username for the Azure Container Registry, used for authentication. Stored as sensitive data."
    value       = azurerm_container_registry.acr.admin_username
    sensitive   = true
  }
  output "acr_admin_password" {
    description = "The administrator password for the Azure Container Registry, used for authentication. Stored as sensitive data."
    value       = azurerm_container_registry.acr.admin_password
    sensitive   = true
  }

# VM
  output "vm_dns_name" {
    description = "The fully qualified domain name (FQDN) of the public IP assigned to the virtual machine."
    value       = azurerm_public_ip.vm_pip.fqdn
  }

# AKS
  output "aks_kube_config" {
    description = "The raw kubeconfig file for the AKS cluster, used to authenticate and manage the cluster via kubectl. Stored as sensitive data."
    value       = azurerm_kubernetes_cluster.aks.kube_config_raw
    sensitive   = true
  }

  output "aks_public_ip_address" {
    description = "The public IP address of the AKS cluster, used for configuring the ingress-nginx controller. Provides the IP assigned to the public IP resource."
    value       = azurerm_public_ip.aks_pip.ip_address
  }

  output "aks_public_ip_dns_name" {
    description = "The DNS name of the public IP for the AKS cluster, used for configuring the Ingress. Provides the fully qualified domain name (FQDN)."
    value       = azurerm_public_ip.aks_pip.fqdn
  }

  output "azure_load_balancer_resource_group" {
    description = "The name of the resource group where the AKS load balancer and public IP are located, used for configuring the ingress-nginx controller. Provides the node resource group of the AKS cluster."
    value       = azurerm_kubernetes_cluster.aks.node_resource_group
  }

  output "aks_dns_name" {
    description = "The DNS name of the AKS cluster, representing the fully qualified domain name (FQDN) of the Kubernetes API server. This is the endpoint used by tools like kubectl to communicate with the AKS control plane and manage the cluster."
    value       = azurerm_kubernetes_cluster.aks.fqdn
  }
