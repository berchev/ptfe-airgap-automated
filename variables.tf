variable "aws_region" {
  description = "AWS default region"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the bucket"
}

variable "tfe_airgap_bucket_location" {
  description = "TFE Airgap package need to be located in s3 bucket. Please specify the s3 bucket path"
}

variable "airgap_package" {
  description = "Desired tfe Airgap package"
}

variable "replicated_tar" {
  description = "Latest/Stable version of replicated package"
}

variable "ami" {
  description = "AWS ami according to the region"
}

variable "instance_type" {
  description = "AWS instance characteristics"
  default     = "m5.large"
}

variable "key_name" {
  description = "Key pair name"
}

variable "aws_security_group_name" {
  description = "Dedicated security group for tfe-georgiman"
}

variable "tfe_instance_password" {
  description = "Password of tfe instance"
}

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
}

variable "db_username" {
  description = "AWS database username"
}

variable "db_password" {
  description = "AWS database password"
}

variable "db_port" {
  description = "AWS database default port"
  default     = "5432"
}

variable "dns_zone_name" {
  description = "Name of my AWS hosted zone"
}

variable "dns_name_tfe" {
  description = "DNS Name of tfe instance"
}

variable "aws_instance_tfe_instance_tag_name" {
  description = ""
}

variable "aws_s3_bucket_tfe_bucket_tag_name" {
  description = ""
}

variable "aws_db_subnet_group_postgres_subnet_tag_name" {
  description = ""
}