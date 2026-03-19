terraform {
  backend "azurerm" {
    resource_group_name  = "incyberpoc" # le RG où est ton Storage Account
    storage_account_name = "statestoragee"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate" # nom du fichier state
  }

}
provider "azurerm" {
  features {}
}

module "network" {
  source              = "../../modules/network"
  location            = var.location
  resource_group_name = var.resource_group_name
}

module "vm" {
  source               = "../../modules/vm"
  location             = var.location
  resource_group_name  = var.resource_group_name
  network_interface_id = module.network.nic_id
  admin_password       = var.admin_password
  admin_username       = "azureuser"
}