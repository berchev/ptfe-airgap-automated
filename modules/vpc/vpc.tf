# Creating tfe dedicated VPC
resource "aws_vpc" "tfe_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = var.aws_vpc_tfe_vpc_tag_name
  }
}

#Creating gateway for specific VPC (In this way traffic from internet can go in/out of the VPC)
resource "aws_internet_gateway" "tfe_gw" {
  vpc_id = aws_vpc.tfe_vpc.id

  tags = {
    Name = var.aws_internet_gateway_tfe_gw_tag_name
  }
}

# Creating route table for specific VPC
resource "aws_route_table" "tfe_route_table" {
  vpc_id = aws_vpc.tfe_vpc.id

  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = aws_internet_gateway.tfe_gw.id
  }

  tags = {
    Name = var.aws_route_table_tfe_route_table_tag_name
  }
}

# Assign route table to specific VPC
resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.tfe_vpc.id
  route_table_id = aws_route_table.tfe_route_table.id
}

# All availability zones of the current region
data "aws_availability_zones" "available" {
  state = "available"
}

# Creating first subnet for the database
resource "aws_subnet" "first_tfe_subnet" {
  availability_zone = data.aws_availability_zones.available.names[0]
  vpc_id            = aws_vpc.tfe_vpc.id
  cidr_block        = var.first_subnet_cidr_block

  tags = {
    Name = var.aws_subnet_first_tfe_subnet_tag_name
  }
}

# Creating second subnet for the database
resource "aws_subnet" "second_tfe_subnet" {
  availability_zone = data.aws_availability_zones.available.names[1]
  vpc_id            = aws_vpc.tfe_vpc.id
  cidr_block        = var.second_subnet_cidr_block

  tags = {
    Name = var.aws_subnet_second_tfe_subnet_tag_name
  }
}

# Creating separate subnet for the tfe instance
resource "aws_subnet" "third_tfe_subnet" {
  availability_zone = data.aws_availability_zones.available.names[2]
  vpc_id            = aws_vpc.tfe_vpc.id
  cidr_block        = var.third_subnet_cidr_block

  tags = {
    Name = var.aws_subnet_third_tfe_subnet_tag_name
  }
}