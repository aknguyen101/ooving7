variable "resource_group_name" {
  type        = string
  description = "Navn på ressursgruppen"
  default     = "rg-ooving8-dev"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "westeurope"
}

variable "vnet_name" {
  type        = string
  description = "Navn på VNet"
  default     = "vnet-ooving8-dev"
}

variable "address_space" {
  type        = list(string)
  description = "Adresserom for VNet"
  default     = ["10.0.0.0/16"]
}

variable "subnets" {
  type        = map(any)
  description = "Map med subnett"
  default     = {}
}

variable "environment" {
  type        = string
  description = "Miljø"
  default     = "dev"
}

variable "prefix" {
  type        = string
  description = "Prefix"
  default     = "ooving8"
}
