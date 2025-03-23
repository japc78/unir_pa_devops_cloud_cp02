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
  # The Azure subscription ID is required to authenticate and manage resources.
  # Ensure the environment variable AZURERM_SUBSCRIPTION_ID is set in your system with the correct Azure subscription ID.
  # export TF_VAR_AZURERM_SUBSCRIPTION_ID="your-subscription-id"
  # Alternatively, you can define the variable in a Terraform variables file (e.g., terraform.tfvars).
  subscription_id = var.AZURERM_SUBSCRIPTION_ID
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}rg"
  location = var.default_location

  tags = merge(
      var.default_tags,
      {
        name = "${var.prefix}rg"
      }
    )
}