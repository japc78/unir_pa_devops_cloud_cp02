# General
  variable "AZURERM_SUBSCRIPTION_ID" {
    type        = string
    description = "Subscription Id Azure"
  }

  variable "prefix" {
    type        = string
    description = "Prefix for the name of the resources"
    default     = ""
  }

variable "default_tags" {
  description = "Common Tags for all resources"
  type        = map(string)
  default = {
    environment = "casopractico2"
    owner       = "japc.dev@gmail.com"
    project     = "Unir-PA-Devops-cp2"
  }
}
