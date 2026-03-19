variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du Resource Group"
  type        = string
}

variable "admin_password" {
  description = "Mot de passe administrateur pour la VM (ne pas committer en clair)"
  type        = string
  sensitive   = true
}
variable "admin_username" {
  description = "Nom de l'administrateur pour la VM"
  type        = string
}

variable "rdp_source_address_prefix" {
  description = "CIDR source autorisé pour les connexions RDP (limiter en production)"
  type        = string
}