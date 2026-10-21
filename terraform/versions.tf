terraform {
  required_version = ">= 1.6"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }

  # Remote state in Azure Storage. Values are passed at init time:
  #   terraform init -backend-config=backend.hcl
  # For local validation only:
  #   terraform init -backend=false
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  # Subscription is read from the ARM_SUBSCRIPTION_ID environment variable.
}
