data "aws_route53_zone" "my_dns_zone" {
  name = var.dns_zone_name
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.my_dns_zone.zone_id
  name    = "${var.dns_name_ptfe}."
  type    = "A"
  ttl     = "300"
  records = [aws_instance.ptfe_instance.public_ip]
}