output "tfe_instance_public_ip" {
  value       = aws_instance.tfe_instance.public_ip
  description = "Public IP address of the tfe instance"
}

output "tfe_instance_public_dns" {
  value       = aws_instance.tfe_instance.public_dns
  description = "Public DNS address of the tfe instance"
}

output "tfe_instance_private_ip" {
  value       = aws_instance.tfe_instance.private_ip
  description = "Private IP address of the tfe instance"
}

output "tfe_instance_private_dns" {
  value       = aws_instance.tfe_instance.private_dns
  description = "Private DNS address of the tfe instance"
}