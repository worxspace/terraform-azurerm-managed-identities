terraform {
  required_providers {
    azurerm = ">=3.53.0"
    azurecaf = {
      version = "2.0.0-preview3"
      source  = "aztfmod/azurecaf"
    }
    azuread = {
      version = ">=2.34.2"
      source  = "hashicorp/azuread"
    }
  }
}
