# settings.json file represeted as template 
data "template_file" "settinngs_json" {
  template = file("${path.module}/scripts/settings.json.tpl")

  vars = {
    pg_dbname    = aws_db_instance.postgres.name
    pg_netloc    = aws_db_instance.postgres.endpoint
    hostname     = var.dns_name_tfe
    pg_password  = var.db_password
    enc_password = var.tfe_instance_password
    pg_user      = var.db_username
    s3_bucket    = var.bucket_name
    s3_region    = var.region
  }
}

# replicated.conf file represented as template
data "template_file" "replicated_conf" {
  template = file("${path.module}/scripts/replicated.conf.tpl")

  vars = {
    DaemonAuthenticationPassword = aws_db_instance.postgres.password
    TlsBootstrapHostname         = var.dns_name_tfe
    tfe_package                  = var.airgap_package
  }
}

# bootstraping script represented as a template 
data "template_file" "bootstrap_sh" {
  template = file("${path.module}/scripts/bootstrap.sh")

  vars = {
    location_path       = var.tfe_airgap_bucket_location
    tfe_package         = var.airgap_package
    bootstrap_installer = var.replicated_tar
  }
}

data "template_cloudinit_config" "tfe_setup" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = <<EOF
#cloud-config
write_files:
  - content: |
      ${base64encode("${data.template_file.settinngs_json.rendered}")}
    encoding: b64
    owner: root:root
    path: /opt/tfe-installer/settings.json
    permissions: '0644'

  - content: |
      ${base64encode("${data.template_file.replicated_conf.rendered}")}
    encoding: b64
    owner: root:root
    path: /etc/replicated.conf
    permissions: '0644'

  - content: |
      ${base64encode("${data.template_file.bootstrap_sh.rendered}")}
    encoding: b64
    owner: root:root
    path: /opt/tfe-installer/bootstrap.sh
    permissions: '0755'

runcmd:
  - /opt/tfe-installer/bootstrap.sh
EOF
  }

  part {
    content = data.template_file.settinngs_json.rendered
  }

  part {
    content = data.template_file.replicated_conf.rendered
  }

  part {
    content = data.template_file.bootstrap_sh.rendered
  }

}

resource "aws_instance" "tfe_instance" {
  depends_on                  = [aws_internet_gateway.tfe_gw]
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.third_tfe_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.tfe_sg.id]
  iam_instance_profile        = aws_iam_instance_profile.tfe_instance.name
  user_data_base64            = data.template_cloudinit_config.tfe_setup.rendered

  root_block_device {
    volume_size = 128
  }

  tags = {
    Name = var.aws_instance_tfe_instance_tag_name
  }

}