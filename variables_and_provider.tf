variable "region" {
  description = "AWS default region"
  default     = "us-east-1"
}

#### Bucket needed for PTFE installation itself
variable "bucket_name" {
  description = "Name of the bucket"
  default     = "georgiman-ptfe-bucket"
}

#### PTFE Airgap package s3 path location
variable "ptfe_airgap_bucket_location" {
  description = "TFE Airgap package need to be located in s3 bucket. Please specify the s3 bucket path"
  default     = "berchev-bucket-test/ptfe-v4/"
}

#### Desired PTFE Airgap package (The name of the package resided into the Assets bucket)
variable "airgap_package" {
  description = "Desired PTFE Airgap package"
  default     = "airgap_package_latest.airgap"
}

# Latest/Stable version of replicated tar (The name of the tar resided into the Assets bucket. Latest version can be downloaded from here: https://install.terraform.io/airgap/latest.tar.gz)
variable "replicated_tar" {
  description = "Latest/Stable version of replicated package"
  default     = "replicated.tar.gz"
}

#### PTFE instance variables definition 
variable "ami" {
  description = "AWS ami according to the region"
  default     = "ami-08d4a16189d2a080d"
}

variable "instance_type" {
  description = "AWS instance characteristics"
  default     = "m5.large"
}

variable "key_name" {
  description = "Key pair name"
  default     = "berchev_key_pair"
}

variable "aws_security_group_name" {
  description = "Dedicated security group for ptfe-georgiman"
  default     = "ptfe-georgiman-sg"
}

variable "ptfe_instance_password" {
  description = "Password of PTFE instance"
  default     = "Password123#"
}
#### Database variables definition 
variable "db_subnet_group_name" {
  description = "AWS database subnet group name"
  default     = "postgres_db_subnet_group"
}

variable "db_allocated_storage" {
  description = "Storage attached to database"
  default     = 50
}

variable "db_storage_type" {
  description = "Storage type of database"
  default     = "gp2"
}

variable "db_engine" {
  description = "Database kind"
  default     = "postgres"
}

variable "db_version" {
  description = "AWS Database version"
  default     = "11.5"
}

variable "db_instance_class" {
  description = "AWS database characteristics"
  default     = "db.m4.large"
}


variable "db_name" {
  description = "AWS database name"
  default     = "PostgresGeorgiman"
}

variable "db_username" {
  description = "AWS database username"
  default     = "postgres"
}

variable "db_password" {
  description = "AWS database password"
  default     = "Password123#"
}

variable "db_port" {
  description = "AWS database default port"
  default     = "5432"
}

#### DNS record creation. BE CAREFUL with changing of DNS record you need to change DNS Name too!!!!
variable "dns_zone_name" {
  description = "Name of my AWS hosted zone"
  default     = "georgiman.com."
}

#### DNS Name of PTFE instance. BE CAREFUL check if DNS record
variable "dns_name_ptfe" {
  description = "DNS Name of PTFE instance"
  default     = "newptfe.georgiman.com"
}

#### Provider definition
provider "aws" {
  region = var.region
}