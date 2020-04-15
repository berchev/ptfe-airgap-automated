variable "dns_zone_name" {
  description = "Name of my AWS hosted zone"
}

variable "dns_name_tfe" {
  description = "DNS Name of tfe instance"
}

variable "tfe_instance_public_ip" {
  description = "DNS Name of tfe instance. Will be known once the apply finish"
}
