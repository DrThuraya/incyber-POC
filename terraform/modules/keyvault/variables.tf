variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du Resource Group"
  type        = string
}

variable "key_vault_name" {
  description = "Nom du Key Vault (doit être unique dans Azure)"
  type        = string
}
