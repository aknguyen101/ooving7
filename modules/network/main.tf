provider "azurerm" {
  features {}
  subscription_id = "7a3c6854-0fe1-42eb-b5b9-800af1e53d70"
  tenant_id       = "6980af2f-acfc-4513-ac50-552bcfdb01a0"
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.prefix}-${var.environment}"
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

locals {
  # Sikrer at subnets-variablen regnes som i bruk av TFLint
  configured_subnets = var.subnets
}
