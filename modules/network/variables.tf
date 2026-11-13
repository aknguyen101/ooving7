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
variable "environment" {
  type        = string
  description = "Miljø (f.eks. dev)"
  default     = "dev"
}

variable "prefix" {
  type        = string
  description = "Ressursprefiks"
  default     = "ooving8"
}
variable "project" {
  type        = string
  description = "Project name (must be lowercase)"
  validation {
    condition     = can(regex("^[a-z0-9-]+$", var.project))
    error_message = "Project name must consist of lowercase letters, numbers, and hyphens."
  }
}
