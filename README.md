# ptfe-airgap-automated


## Description
The repo is just an example how to perform TFE version 4 airgap installation with valid certificate into AWS Cloud.

Following immutable infrastructure principles, we will build custom ec2 image with packer, which fullfil all TFE requirements.
[How to build such image](https://github.com/berchev/packer-ec2-bionic64-docker)

We will use Terraform OSS and AWS to prepare an environment needed for TFE Airgap instalation.

The Airgap installation itself will be performed by simple bash script, right after TFE instance provision.

The TFE Airgap installer script will do following:
- download Airgap package from s3 Assets bucket into /opt/tfe-installer directory
- download replicated tar, which is actually the bootstrap installer for TFE, into /opt/tfe-installer directory
- extract replicated tar
- running the install script with all needed arguments


By changing variables only, you can perform your own installation based on this one. 

More details about the AWS environment itself, can be found into **Environment diagram** section down below

## Environment diagram
![](https://github.com/berchev/ptfe-airgap-automated/blob/master/diagram/diagram.png)

## Repo Content
| File                   | Description                      |
|         ---            |                ---               |
| [aws_ptfe_role.tf](aws_ptfe_role.tf) | Creating an aws role for our instance. |
| [dns_record.tf](dns_record.tf) | Creating DNS record using the IP of newly created instance|
|[outputs.tf](outputs.tf)| After terraform finish its work, will prin on the screen everything that user need to know about newly created environment|
|[postgres.tf](postgres.tf)| Terraform code for PostgeSQL database|
|[ptfe_instance.tf](ptfe_instance.tf)| Terraform code for our TFE instance |
|[security_groups.tf](security_groups.tf)| Terraform code related to security groups of TFE instance and PostgreSQL |
|[variables_and_provider.tf](variables_and_provider.tf)| All variables in this project. Please review and edit if needed |
|[vpc.tf](vpc.tf)| Terraform code related to the whole network infrastructure |
|[bucket.tf](bucket.tf)| Terraform code related to PTFE instance bucket creation |
|[scripts/bootstrap.sh](scripts/bootstrap.sh)| TFE installer script|
|[scripts/replicated.conf.tpl](scripts/replicated.conf.tpl)| Replicated configuration file passed like a template, populated with needed variables|
|[scripts/settings.json.tpl](scripts/settings.json.tpl)| TFE settings passed like a template, populated with needed variables|

## Pre-requirements for this project
- Valid SSL sertificate 
- TFE license (you can get one reaching Hashicorp Sales Team)
- Airgap package with desired TFE version
- [Installer bootstraper](https://install.terraform.io/airgap/latest.tar.gz)
- Packer installed

## Requirements
- AWS Account
- Terraform OSS installed
- Your own Domain (I am using one from AWS)

## How to install TFE Airgap 
- make sure you have succesfully builded AWS ami, according to the description in the beginning
- clone the repo locally
```
git clone https://github.com/berchev/ptfe-airgap-automated.git
```

- review [variables_and_provider.tf](variables_and_provider.tf) and change variables value according to your needs. 
- export your AWS access and secret key 
```
export AWS_ACCESS_KEY_ID="XXXXXXXXXXXXXXXXXXX"
export AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
``` 
- install all needed Terraform providers
```
terraform init
```
- check which resources terraform is going to create
```
terraform plan
```
- if no errors occurs, and you are satisfied with the result, apply the changes
```
terraform apply
```
- once terraform finish, you will see an output very similar to this one:
```
postgres_hostname = terraform-20200317132059697800000001.coldp6eoybn0.us-east-1.rds.amazonaws.com:5432
postgres_name = PostgresGeorgiman
ptfe_instance_private_dns = ip-172-0-3-192.ec2.internal
ptfe_instance_private_ip = 172.0.3.192
ptfe_instance_public_dns = ec2-54-174-170-9.compute-1.amazonaws.com
ptfe_instance_public_ip = 54.174.170.9
```
- right after that, the automated installation begin. Ordinary it will take 30 to 40 minutes.
- after that time you can try to reach the dashboard on url: `http://your_tfe_fqdn:8800`. It should look like this:
```
```
- if everything looks good, you can visit `https://your_tfe_fqdn`. It should look like this:
```
```

