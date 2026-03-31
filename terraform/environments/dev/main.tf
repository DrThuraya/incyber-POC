terraform {
  backend "azurerm" {
    resource_group_name  = "incyberpoc"
    storage_account_name = "statestoragee"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "network" {
  source                      = "../../modules/network"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  rdp_source_address_prefixes = var.rdp_source_address_prefixes
}

module "keyvault" {
  source              = "../../modules/keyvault"
  location            = var.location
  resource_group_name = var.resource_group_name
  key_vault_name      = "kv-incyber-${var.environment}"
}

module "vm" {
  source               = "../../modules/vm"
  location             = var.location
  resource_group_name  = var.resource_group_name
  network_interface_id = module.network.nic_id
  admin_password       = module.keyvault.admin_password
  admin_username       = var.admin_username
}
