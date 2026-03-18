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