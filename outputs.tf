output "postgres_name" {
  value       = module.db.postgres_name
  description = "Output of module db - Postgres database name"
}

output "postgres_hostname" {
  value       = module.db.postgres_hostname
  description = "Output of module db - Postgres database hostname"
}

output "tfe_instance_public_ip" {
  value       = module.tfe_instance.tfe_instance_public_ip
  description = "Output of module tfe_instance - Public IP address of the tfe instance"
}

output "tfe_instance_public_dns" {
  value       = module.tfe_instance.tfe_instance_public_dns
  description = "Output of module tfe_instance - Public DNS address of the tfe instance"
}

output "tfe_instance_private_ip" {
  value       = module.tfe_instance.tfe_instance_private_ip
  description = "Output of module tfe_instance - Private IP address of the tfe instance"
}

output "tfe_instance_private_dns" {
  value       = module.tfe_instance.tfe_instance_private_dns
  description = "Output of module tfe_instance - Private DNS address of the tfe instance"
}