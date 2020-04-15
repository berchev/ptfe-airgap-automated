
module "db" {
  source                                       = "./modules/db"
  aws_region                                   = var.aws_region
  db_subnet_group_name                         = var.db_subnet_group_name
  tfe_postgres_sg_name                         = var.tfe_postgres_sg_name
  aws_security_group_tfe_postgres_tag_name     = var.aws_security_group_tfe_postgres_tag_name
  db_allocated_storage                         = var.db_allocated_storage
  db_storage_type                              = var.db_storage_type
  db_engine                                    = var.db_engine
  db_version                                   = var.db_version
  db_instance_class                            = var.db_instance_class
  db_name                                      = var.db_name
  db_username                                  = var.db_username
  db_password                                  = var.db_password
  db_port                                      = var.db_port
  aws_db_subnet_group_postgres_subnet_tag_name = var.aws_db_subnet_group_postgres_subnet_tag_name
  vpc_id                                       = module.vpc.vpc_id
  first_tfe_subnet                             = module.vpc.first_tfe_subnet
  second_tfe_subnet                            = module.vpc.second_tfe_subnet
}

module "r53" {
  source                 = "./modules/r53"
  aws_region             = var.aws_region
  dns_zone_name          = var.dns_zone_name
  dns_name_tfe           = var.dns_name_tfe
  tfe_instance_public_ip = module.tfe_instance.tfe_instance_public_ip
}

module "s3" {
  source                            = "./modules/s3"
  aws_region                        = var.aws_region
  bucket_name                       = var.bucket_name
  aws_s3_bucket_tfe_bucket_tag_name = var.aws_s3_bucket_tfe_bucket_tag_name
}

module "tfe_instance" {
  source                               = "./modules/tfe_instance"
  aws_region                           = var.aws_region
  tfe_instance_role_name               = var.tfe_instance_role_name
  aws_tfe_instance_security_group_name = var.aws_tfe_instance_security_group_name
  aws_security_group_name              = var.aws_security_group_name
  aws_security_group_tfe_sg_tag_name   = var.aws_security_group_tfe_sg_tag_name
  tfe_instance_policy_name             = var.tfe_instance_policy_name
  tfe_instance_profile_name            = var.tfe_instance_profile_name
  #TlsBootstrapHostname               = var.dns_name_tfe
  #tfe_package                        = var.airgap_package
  #s3_region                          = var.aws_region
  #hostname                           = var.dns_name_tfe
  #pg_password                        = var.db_password
  #enc_password                       = var.tfe_instance_password
  #pg_user                            = var.db_username
  #s3_bucket                          = var.bucket_name
  #DaemonAuthenticationPassword       = module.db.aws_db_instance.postgres.password
  #location_path                      = var.tfe_airgap_bucket_location
  #bootstrap_installer                = var.replicated_tar
  dns_name_tfe          = var.dns_name_tfe
  airgap_package        = var.airgap_package
  db_password           = var.db_password
  tfe_instance_password = var.tfe_instance_password
  db_username           = var.db_username
  db_name               = var.db_name
  bucket_name           = var.bucket_name
  #DaemonAuthenticationPassword       = module.db.aws_db_instance.postgres.password
  tfe_airgap_bucket_location         = var.tfe_airgap_bucket_location
  replicated_tar                     = var.replicated_tar
  ami                                = var.ami
  instance_type                      = var.instance_type
  key_name                           = var.key_name
  aws_instance_tfe_instance_tag_name = var.aws_instance_tfe_instance_tag_name
  tfe_instance_volume_size           = var.tfe_instance_volume_size
  vpc_id                             = module.vpc.vpc_id
  pg_netloc                          = module.db.postgres_hostname
  third_tfe_subnet                   = module.vpc.third_tfe_subnet
}

module "vpc" {
  source                                   = "./modules/vpc"
  aws_region                               = var.aws_region
  vpc_cidr_block                           = var.vpc_cidr_block
  aws_vpc_tfe_vpc_tag_name                 = var.aws_vpc_tfe_vpc_tag_name
  aws_internet_gateway_tfe_gw_tag_name     = var.aws_internet_gateway_tfe_gw_tag_name
  route_table_cidr_block                   = var.route_table_cidr_block
  aws_route_table_tfe_route_table_tag_name = var.aws_route_table_tfe_route_table_tag_name
  first_subnet_cidr_block                  = var.first_subnet_cidr_block
  aws_subnet_first_tfe_subnet_tag_name     = var.aws_subnet_first_tfe_subnet_tag_name
  second_subnet_cidr_block                 = var.second_subnet_cidr_block
  aws_subnet_second_tfe_subnet_tag_name    = var.aws_subnet_second_tfe_subnet_tag_name
  third_subnet_cidr_block                  = var.third_subnet_cidr_block
  aws_subnet_third_tfe_subnet_tag_name     = var.aws_subnet_third_tfe_subnet_tag_name
}