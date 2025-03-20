resource "azurerm_linux_virtual_machine" "vm" {
  name                  = "${var.prefix}vm"
  resource_group_name   = azurerm_resource_group.rg.name
  location              = azurerm_resource_group.rg.location
  size                  = var.vm_size
  admin_username        = "${var.prefix}vm-${var.vm_admin_username}"
  network_interface_ids = [azurerm_network_interface.vm_nic.id]

  admin_ssh_key {
    username   = "${var.prefix}vm-${var.vm_admin_username}"
    public_key = tls_private_key.vm_ssh_key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_image_publisher
    offer     = var.vm_image_offer
    sku       = var.vm_image_sku
    version   = var.vm_image_version
  }

  tags = merge(
    var.default_tags,
    {
      name = "${var.prefix}vm"
    }
  )

  depends_on = [ tls_private_key.vm_ssh_key ]
}
