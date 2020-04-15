# ptfe-airgap-automated


## Description
The repo is just an example how to perform TFE version 4 airgap installation with valid certificate into AWS Cloud.

Following immutable infrastructure principles, we will 
- build custom ec2 image with packer, which fullfil all [TFE requirements](https://www.terraform.io/docs/enterprise/before-installing/index.html).
- use Terraform OSS and AWS to prepare the needed environment and the TFE Airgap installation itself

The Airgap installation will be performed by simple bash script, right after TFE instance provisioning.

The TFE Airgap installer script will do following:
- download Airgap package from s3 Assets bucket to /opt/tfe-installer directory of the ec2 instance
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
| [modules/db](modules/db) | Terraform code for Postgres database module |
| [modules/r53](modules/r53) | Terraform code for Route 53 module|
| [modules/s3](modules/s3)| Terraform code for S3 Bucket module|
|[modules/tfe_instance](modules/tfe_instance)| Terraform code for TFE Instance module|
|[modules/vpc](modules/vpc)| Terraform code for VPC module |
|[packer](packer)| Packer code and confuguration needed for building appropriate for TFE ec2 image  |
|[scripts/bootstrap.sh](scripts/bootstrap.sh)| TFE installer script|
|[scripts/replicated.conf.tpl](scripts/replicated.conf.tpl)| Replicated configuration file passed like a template, populated with needed variables|
|[scripts/settings.json.tpl](scripts/settings.json.tpl)| TFE settings passed like a template, populated with needed variables|
|[main.tf](main.tf)| main Terraform file, that calls all the modules in this project |
|[outputs.tf](outputs.tf)| Terraform outputs |
|[provider_aws.tf](provider_aws.tf)| Terraform provider file that includes the cloud provider only |
|[terraform.tfvars](terraform.tfvars)| Example of terraform.tfvars file |
|[variables.tf](variables.tf)| Terraform variables file |


## Requirements for this project
- AWS Account
- Your own Domain (I am using one from AWS)
- Valid SSL sertificate 
- TFE license (you can get one reaching Hashicorp Sales Team)
- Airgap package with desired TFE version
- [Installer bootstraper](https://install.terraform.io/airgap/latest.tar.gz)
- Packer installed
- Terraform OSS version 0.12.X installed

## Initial setup (Preparing for *terrafom apply* command)
- Part I - AWS Console 
  - Go to [AWS Console](https://aws.amazon.com/)
  - Create S3 Assets bucket manually. More info [here](https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-bucket.html)
  - Upload `Airgap package with desired TFE version` and `Installer bootstraper`(replicated.tar) into the newly created bucket

- Part II - Packer
  - clone this repository locally
  ```
  git clone https://github.com/berchev/ptfe-airgap-automated.git
  ```
  - change to packer directory
  ```
  cd ptfe-airgap-automated/packer
  ```
  - review variables section of packer json file [packer/ubuntu_docker_ce_ami.json](packer/ubuntu_docker_ce_ami.json) and change the region, ami name or the ami itself if needed.
  - into [packer/assets](packer/assets) directory add your SSL certificates and TFE license
  - export your AWS access and secret key 
  ```
  export AWS_ACCESS_KEY_ID="XXXXXXXXXXXXXXXXXXX"
  export AWS_SECRET_ACCESS_KEY="XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  ```
  - build the ec2 image using following command  
  ```
  packer build ubuntu_docker_ce_ami.json
  ```

## Provisioning TFE environment
- after finishing `Initial setup` section successfully, you are ready for Terraform part
- make sure you are on the root directory on the repo. (where main.tf is located)
- review the example of [terraform.tfvars](terraform.tfvars) file and add populate your values
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
![](https://github.com/berchev/ptfe-airgap-automated/blob/master/screens/20.png)

- if everything looks good, you can visit `https://your_tfe_fqdn`. It should look like this:
![](https://github.com/berchev/ptfe-airgap-automated/blob/master/screens/21.png)
