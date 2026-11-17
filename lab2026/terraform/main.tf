terraform {
  required_providers {
    panos = {
      source  = "PaloAltoNetworks/panos"
      version = "~> 1.11"
    }
  }
}

variable "panorama_ip" {
  type    = string
  default = "192.0.2.10"
}

variable "panorama_api_key" {
  type      = string
  sensitive = true
}

provider "panos" {
  hostname = var.panorama_ip
  api_key  = var.panorama_api_key
}
variable "address_objects" {
  type = map(string)
  default = {
    "web-01" = "10.10.20.15/32"
    "app-01" = "10.10.30.25/32"
  }
}

resource "panos_address_object" "this" {
  for_each     = var.address_objects
  name         = each.key
  value        = each.value
  type         = "ip-netmask"
  device_group = "Lab-DG"
  description  = "chg0001234"
}