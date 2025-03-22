resource "local_file" "inventory" {
  content  = local.inventory_content
  filename = "${var.base_path}/ansible/inventories/inventory"
}

resource "local_file" "private_key" {
  content         = tls_private_key.vm_ssh_key.private_key_pem
  filename        = "${var.base_path}/ansible/ssh_keys/vm_ssh_key.pem"
  file_permission = "0600"
}

resource "local_file" "kube_config" {
  content         = azurerm_kubernetes_cluster.aks.kube_config_raw
  filename        = "${var.base_path}/ansible/kube_config/${azurerm_kubernetes_cluster.aks.name}.config"
  file_permission = "0600"
}

locals {
  inventory_content = templatefile("${path.module}/inventory.tmpl", {
    vm_dns_name                            = azurerm_public_ip.vm_pip.fqdn
    vm_admin_username                      = azurerm_linux_virtual_machine.vm.admin_username
    vm_ssh_private_key                     = local_file.private_key.filename


    acr_login_server                       = azurerm_container_registry.acr.login_server
    acr_admin_password                     = azurerm_container_registry.acr.admin_password
    acr_admin_username                     = azurerm_container_registry.acr.admin_username
    acr_admin_password                     = azurerm_container_registry.acr.admin_password

    aks_kube_context                       = azurerm_kubernetes_cluster.aks.name
    aks_kube_config_path                   = local_file.kube_config.filename
    aks_public_ip_address                  = azurerm_public_ip.aks_pip.ip_address
    aks_public_ip_dns_name                 = azurerm_public_ip.aks_pip.fqdn
    aks_azure_load_balancer_resource_group = azurerm_kubernetes_cluster.aks.node_resource_group
  })
}