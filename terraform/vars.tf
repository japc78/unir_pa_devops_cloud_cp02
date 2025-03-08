# General
	variable "AZURERM_SUBSCRIPTION_ID" {
		type = string
		description = "Subscription Id Azure"
	}

	variable "prefix" {
		type = string
		description = "Prefix for the name of the resources"
		default = ""
	}

# Azure Container Registry
	variable "acr_name" {
		type = string
		description = "Azure Container Registry"
	}