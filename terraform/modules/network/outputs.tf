output "subnet_frontend_id" {
  value = azurerm_subnet.frontend.id
}

output "nsg_id" {
  value = azurerm_network_security_group.nsg.id
}

output "nic_id" {
  value = azurerm_network_interface.nic.id
}

output "public_ip" {
  value = azurerm_public_ip.vm_public_ip.ip_address
}