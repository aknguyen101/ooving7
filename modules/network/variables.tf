variable "resource_group_name" {
  type        = string
  description = "Navn på ressursgruppen"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "vnet_name" {
  type        = string
  description = "Navn på VNet"
}

variable "address_space" {
  type        = list(string)
  description = "Adresserom for VNet"
}

variable "subnets" {
  type        = map(any)
  description = "Map med subnett"
}
