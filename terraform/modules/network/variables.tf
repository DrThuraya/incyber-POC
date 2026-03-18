variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du Resource Group"
  type        = string
}

variable "rdp_source_address_prefix" {
  description = "CIDR source autorisé pour les connexions RDP (limiter en production)"
  type        = string
  default     = "0.0.0.0/0" # changer pour restreindre l'accès
}