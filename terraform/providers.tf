terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-platform-shared"
    storage_account_name = "stplatformsharedtf"
    container_name       = "tfstate"
    key                  = "team-portal.tfstate"
  }
}

provider "azurerm" {
  features {}
}