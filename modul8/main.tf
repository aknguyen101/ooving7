module "network" {
  source = "git::https://github.com/aknguyen101/ooving7.git//modules/network?ref=network-v1.1.0"

  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnets             = var.subnets
}
