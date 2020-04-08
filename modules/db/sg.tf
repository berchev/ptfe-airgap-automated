# Creating security group and rule for Postgers Database 
resource "aws_security_group" "tfe_postgres" {
  name   = "allow_postgres_connection"
  vpc_id = aws_vpc.tfe_vpc.id

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tfe_postgres"
  }
}
