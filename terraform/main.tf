terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.22.0"
    }
  }

  required_version = ">= 1.1.1"
}

provider "azurerm" {
  features {}
  subscription_id = var.AZURERM_SUBSCRIPTION_ID
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}rg"
  location = "West Europe"

  tags = {
    name = "cp2-rg"
  	environment = "cp2"
    owner = "japc.dev@gmail.com"
    project = "Unir-PA-Devops-cp2"
  }
}