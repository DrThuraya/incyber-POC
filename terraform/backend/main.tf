# Terraform pour le backend state
provider "azurerm" {
  features {}
}

# Resource Group pour le state (si ce n'est pas déjà créé)
resource "azurerm_resource_group" "tfstate_rg" {
  name     = "rg-incyber-dev"
  location = "France Central"
}

# Storage Account pour le backend
resource "azurerm_storage_account" "tfstate_sa" {
  name                     = "tfstateincyber" # doit être unique globalement
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = azurerm_resource_group.tfstate_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# Container blob pour stocker le state
resource "azurerm_storage_container" "tfstate_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate_sa.name
  container_access_type = "private"
}