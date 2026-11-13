provider "azurerm" {
  features {}
  subscription_id = "7a3c6854-0fe1-42eb-b5b9-800af1e53d70"
  tenant_id       = "6980af2f-acfc-4513-ac50-552bcfdb01a0"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    environment = var.environment
    prefix      = var.prefix
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet-internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = values(var.subnets)
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-internal"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association" "nsg_assoc" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
```[cite: 14]

<Steps>
  <Step subtitle="Steg 1" title="Oppdater filen på GitHub">
    Gå til `modules/network/main.tf` i ditt GitHub-repository, klikk på blyantikonet (**Edit**), lim inn koden ovenfor, og trykk **Commit changes**.
    *Verifisering:* Endringen lagres i `main`-branchen.
  </Step>
  
  <Step subtitle="Steg 2" title="Sjekk pipelinen">
    Gå til **Actions**-fanen og følg med på at `test-network`-kjøringen starter automatisk.
    *Verifisering:* Alle stegene – inkludert Checkov – fullfører nå uten feil og blir helt grønne, slik at du kan gå videre til å tagge `network-v1.2.0`.
  </Step>
</Steps>
