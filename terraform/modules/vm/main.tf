# VM Windows
resource "azurerm_windows_virtual_machine" "vm" {
  name                = "vm-incyber"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_D2s_v3"

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [
    var.network_interface_id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter"
    version   = "latest"
  }
}