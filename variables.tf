variable "aws_region" {
  description = "AWS default region"
}

###################
#    S3 BUCKET    #
###################
variable "bucket_name" {
  description = "Name of the bucket"
}

variable "aws_s3_bucket_tfe_bucket_tag_name" {
  description = "Tag Name of the bucket"
}

#####################
#     DNS RECORD    #
#####################
variable "dns_zone_name" {
  description = "Name of my AWS hosted zone"
}

variable "dns_name_tfe" {
  description = "DNS Name of tfe instance"
}

# variable "tfe_instance_public_ip" {
#   description = "DNS Name of tfe instance. Will be known once the apply finish"
# }

#####################
#    DB POSTGRES    #
##################### 
variable "db_subnet_group_name" {
  description = "AWS database subnet group name"
}

variable "tfe_postgres_sg_name" {
  description = "AWS database postgres security group name"
}

variable "aws_security_group_tfe_postgres_tag_name" {
  description = "AWS database postgres security group tag name"
}

variable "db_allocated_storage" {
  description = "Storage attached to Postgres database"
}

variable "db_storage_type" {
  description = "Storage type of Postgres database"
}

variable "db_engine" {
  description = "Database engine kind"
}

variable "db_version" {
  description = "AWS Database version"
}

variable "db_instance_class" {
  description = "AWS database size characteristics"
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
}

variable "aws_db_subnet_group_postgres_subnet_tag_name" {
  description = "all DB subnets assigned to the Postgres database"
}
######################
#    TFE INSTANCE    #
###################### 
variable "tfe_instance_role_name" {
  description = "Name of the tfe_instance role"
}

variable "tfe_instance_policy_name" {
  description = "Name of the tfe_instance policy"
}

variable "tfe_instance_profile_name" {
  description = "Name of the tfe_instance profile"
}

variable "aws_security_group_name" {
  description = " tfe security group"
}


variable "aws_security_group_tfe_sg_tag_name" {
  description = "Tag name of the tfe security group"
}

variable "aws_tfe_instance_security_group_name" {
  description = "Dedicated security group for tfe instance"
}

variable "airgap_package" {
  description = "Desired tfe Airgap package"
}

variable "tfe_instance_password" {
  description = "Password of tfe instance"
}

variable "tfe_airgap_bucket_location" {
  description = "TFE Airgap package need to be located in S3 Assets Bucket. Please specify the s3 bucket path"
}

variable "replicated_tar" {
  description = "Latest/Stable version of replicated package located in S3 Assets Bucket"
}

variable "ami" {
  description = "AWS ami according to the region"
}

variable "instance_type" {
  description = "AWS instance size characteristics"
}

variable "key_name" {
  description = "AWS key pair name"
}

variable "aws_instance_tfe_instance_tag_name" {
  description = "Tag name of AWS tfe instance"
}

variable "tfe_instance_volume_size" {
  description = "Root volume size of the tfe instance"
}

# variable "pg_netloc" {
#   description = "AWS database hostname and port. Should be known after creation"
# }

#############
#    VPC    #
#############
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

# Common for DB and Instance
# variable "vpc_id" {
#   description = "ID of created TFE VPC, passed among the modules. Will be known after creation."
# }

