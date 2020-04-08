module "db" {
  source = "./modules/db"
}

module "r53" {
  source = "./modules/r53"
}

module "s3" {
  source = "./modules/s3"
}

module "vpc" {
  source = "./modules/vpc"
}
