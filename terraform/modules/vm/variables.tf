variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du Resource Group"
  type        = string
}

variable "network_interface_id" {
  description = "ID de la NIC"
  type        = string
}

variable "admin_username" {
  description = "Nom de l'administrateur"
  type        = string
}

variable "admin_password" {
  description = "Mot de passe administrateur"
  type        = string
}