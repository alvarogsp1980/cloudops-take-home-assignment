# Set terraform required version
terraform {
  required_version = "~>1.1.9"
  required_providers {
    azurerm = {
      version = "~>2.51"
    }
  }
}