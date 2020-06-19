aws_region                                   = "us-east-1"
# S3 BUCKET #
bucket_name                                  = "georgiman-tfe-bucket"
aws_s3_bucket_tfe_bucket_tag_name            = "tfe bucket"
# R53 DNS #
dns_zone_name                                = "georgiman.com."
dns_name_tfe                                 = "newptfe.georgiman.com"
# DB POSTGRES #
db_subnet_group_name                         = "postgres_db_subnet_group"
tfe_postgres_sg_name                         = "allow_postgres_connection"
db_allocated_storage                         = 50
aws_security_group_tfe_postgres_tag_name     = "TFE_Postgres_DB"
db_storage_type                              = "gp2"
db_engine                                    = "postgres"
db_version                                   = "11.5"
db_instance_class                            = "db.m4.large"
db_name                                      = "PostgresGeorgiman"
db_username                                  = "postgres"
db_password                                  = "Password123#"
db_port                                      = "5432"
aws_db_subnet_group_postgres_subnet_tag_name = "Postgres_DB_subnet_group"
# TFE INSTANCE #
tfe_instance_role_name                       = "tfe_instance_role"
tfe_instance_policy_name                     = "tfe_instance_policy"
tfe_instance_profile_name                    = "tfe_instance_profile"
aws_security_group_name                      = "tfe_instance_security_group"
aws_security_group_tfe_sg_tag_name           = "tfe_instance_security_group"
aws_tfe_instance_security_group_name         = "tfe_instance_sg"
airgap_package                               = "airgap_package_latest.airgap"
tfe_instance_password                        = "Password123#"
tfe_airgap_bucket_location                   = "berchev-bucket-test/tfe-v4/"
replicated_tar                               = "replicated.tar.gz"
ami                                          = "ami-041049fef72263c00"
instance_type                                = "m5.large"
key_name                                     = "berchev_key_pair"
aws_instance_tfe_instance_tag_name           = "tfe-georgiman"
tfe_instance_volume_size                     = 128
# VPC #
vpc_cidr_block                               = "172.0.0.0/16"
aws_vpc_tfe_vpc_tag_name                     = "tfe_vpc"
aws_internet_gateway_tfe_gw_tag_name         = "tfe_gw"
route_table_cidr_block                       = "0.0.0.0/0"
aws_route_table_tfe_route_table_tag_name     = "tfe_route"
first_subnet_cidr_block                      = "172.0.1.0/24"
aws_subnet_first_tfe_subnet_tag_name         = "first_tfe_subnet"
second_subnet_cidr_block                     = "172.0.2.0/24"
aws_subnet_second_tfe_subnet_tag_name        = "second_tfe_subnet"
third_subnet_cidr_block                      = "172.0.3.0/24"
aws_subnet_third_tfe_subnet_tag_name         = "third_tfe_subnet"