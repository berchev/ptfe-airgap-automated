output "vpc_id" {
  value       = aws_vpc.tfe_vpc.id
  description = "VPC ID output"
}

output "first_tfe_subnet" {
  value       = aws_subnet.first_tfe_subnet.id
  description = "first_tfe_subnet id"
}

output "second_tfe_subnet" {
  value       = aws_subnet.second_tfe_subnet.id
  description = "second_tfe_subnet id"
}

output "third_tfe_subnet" {
  value       = aws_subnet.third_tfe_subnet.id
  description = "third_tfe_subnet id"
}