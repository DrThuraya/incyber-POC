variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Nom du Resource Group"
  type        = string
}

variable "rdp_source_address_prefixes" {
  description = "Liste des CIDR sources autorisés pour les connexions RDP"
  type        = list(string)
  default     = []
}