mock_provider "azurerm" {}

variables {
  resource_group_name = "rg-test-net"
  location            = "northeurope"
  vnet_name           = "vnet-test"
  address_space       = ["10.0.0.0/16"]
  project             = "prosjekt1"
  subnets = {
    web = {
      address_prefixes = ["10.0.1.0/24"]
    }
  }
}

run "valid_network_plan" {
  command = plan

  assert {
    condition     = azurerm_virtual_network.vnet.name == "vnet-test"
    error_message = "VNet-navnet stemmer ikke med input."
  }

  assert {
    condition     = contains(azurerm_virtual_network.vnet.address_space, "10.0.0.0/16")
    error_message = "CIDR address_space ble ikke satt riktig."
  }
}

run "invalid_project_name" {
  command = plan

  variables {
    project = "UGYLDIG_PROSJEKT_MED_STORE_BOKSTAVER"
  }

  expect_failures = [
    var.project
  ]
}
