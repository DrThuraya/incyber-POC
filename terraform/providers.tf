terraform {
	required_providers {
		azurerm = {
			source  = "hashicorp/azurerm"
			version = ">= 3.0.0"
		}
	}
}

provider "azurerm" {
	features = {}
}

# Optional: example backend configuration (uncomment and fill values to enable remote state)
# terraform {
#   backend "azurerm" {
#     resource_group_name  = "rg-tfstate"
#     storage_account_name = "mystorageaccount"
#     container_name       = "terraform-state"
#     key                  = "incyber.tfstate"
#   }
# }
