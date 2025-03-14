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