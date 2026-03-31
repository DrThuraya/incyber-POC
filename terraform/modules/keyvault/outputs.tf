output "key_vault_id" {
  value = azurerm_key_vault.kv.id
}

output "admin_password" {
  description = "Mot de passe admin généré et stocké dans le Key Vault"
  value       = random_password.admin_password.result
  sensitive   = true
}
