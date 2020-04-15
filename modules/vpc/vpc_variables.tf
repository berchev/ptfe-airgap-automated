variable "vpc_cidr_block" {
  description = "CIDR block of VPC"
}

variable "aws_vpc_tfe_vpc_tag_name" {
  description = "Tag name for tfe VPC"
}

variable "aws_internet_gateway_tfe_gw_tag_name" {
  description = "Tag name for tfe internet gateway"
}

variable "route_table_cidr_block" {
  description = "CIDR block of the route table"
}

variable "aws_route_table_tfe_route_table_tag_name" {
  description = "Tag name of the route table"
}

variable "first_subnet_cidr_block" {
  description = "CIDR block of the first subnet"
}

variable "aws_subnet_first_tfe_subnet_tag_name" {
  description = "Tag name of the first subnet"
}

variable "second_subnet_cidr_block" {
  description = "CIDR block of the second subnet"
}

variable "aws_subnet_second_tfe_subnet_tag_name" {
  description = "Tag name of the second subnet"
}

variable "third_subnet_cidr_block" {
  description = "CIDR block of the third subnet"
}

variable "aws_subnet_third_tfe_subnet_tag_name" {
  description = "Tag name of the third subnet"
}