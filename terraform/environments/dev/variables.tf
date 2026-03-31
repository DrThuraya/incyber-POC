variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du Resource Group"
  type        = string
}

variable "environment" {
  description = "Nom de l'environnement (dev, prod)"
  type        = string
  default     = "dev"
}

variable "admin_username" {
  description = "Nom de l'administrateur pour la VM"
  type        = string
}

variable "rdp_source_address_prefix" {
  description = "CIDR source autorisé pour les connexions RDP (limiter en production)"
  type        = string
}