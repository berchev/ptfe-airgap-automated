data "aws_route53_zone" "zone" {
  name = var.dns_zone_name
}

resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.zone.zone_id
  name    = "${var.dns_name_tfe}."
  type    = "A"
  ttl     = "300"
  records = [aws_instance.tfe_instance.public_ip]
}