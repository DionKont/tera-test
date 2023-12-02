terraform {

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }

  }
  cloud {
    organization = "DiosTests"

    workspaces {
      name = "TerraTest2"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-7447680b-hands-on-with-terraform-on-azure"
  location = "East US"
}

module "securestorage2" {
  source               = "app.terraform.io/DiosTests/securestorage2/azurerm"
  version              = "1.0.0"
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  azurerm_storage_account  = "rcaistg536438"
  account_replication_type  = "GRS"
}