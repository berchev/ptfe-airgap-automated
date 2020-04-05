#! /bin/bash

set -x 
pushd /opt/tfe-installer/
pwd | tee /tmp/pwd.log

sudo mkdir -p /opt/tfe-installer/

ls -al /opt/tfe-installer/ | tee /tmp/before_start_ls.log

sudo aws s3 cp s3://${location_path}${tfe_package} /opt/tfe-installer/

sudo aws s3 cp s3://${location_path}${bootstrap_installer} /opt/tfe-installer/

ls -al /opt/tfe-installer/ | tee /tmp/aftercopy_from_bucket_ls.log

sudo tar -zvx --overwrite -f /opt/tfe-installer/${bootstrap_installer} -C /opt/tfe-installer/ | tee /tmp/tar.log

ls -al /opt/tfe-installer/ | tee /tmp/ls.log
echo sudo bash -x /opt/tfe-installer/install.sh airgap no-proxy private-address=$(curl -sL http://169.254.169.254/latest/meta-data/local-ipv4) public-address=$(curl -sL http://169.254.169.254/latest/meta-data/public-ipv4) | tee /tmp/echo.log
sudo bash -x /opt/tfe-installer/install.sh airgap no-proxy private-address=$(curl -sL http://169.254.169.254/latest/meta-data/local-ipv4) public-address=$(curl -sL http://169.254.169.254/latest/meta-data/public-ipv4) 2>&1 | tee /tmp/install.log
