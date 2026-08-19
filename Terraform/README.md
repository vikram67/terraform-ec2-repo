# Terraform EC2 Module Example

This repository contains a sample Terraform module structure for creating an EC2 instance and a GitHub Actions CI/CD pipeline. And this doc is good

## Structure

- `modules/ec2/` - reusable EC2 module
- `environments/dev/` - development environment using the module
- `.github/workflows/terraform.yml` - CI/CD workflow

## Usage

1. Update values in `environments/dev/terraform.tfvars.example`.
2. Rename it to `terraform.tfvars`.
3. Initialize and apply:

```bash
cd Terraform/environments/dev
terraform init
terraform plan
terraform apply
oka
```

## GitHub Actions AWS credentials

Create an IAM user with only the permissions required to run this Terraform deployment. Store its access key credentials as GitHub repository secrets.

## Required GitHub secrets

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `AMI_ID`
- `SUBNET_ID`
- `KEY_NAME`

These are used by the GitHub Actions pipeline to run Terraform plan and apply. Correct it
