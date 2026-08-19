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

## GitHub Actions OIDC setup

Create an IAM OIDC identity provider for `https://token.actions.githubusercontent.com` with audience `sts.amazonaws.com`.
Configure `github-terraform-role` to trust that provider. Its role trust policy must allow `sts:AssumeRoleWithWebIdentity` and include conditions matching this repository:

```json
"StringEquals": {
	"token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
},
"StringLike": {
	"token.actions.githubusercontent.com:sub": [
		"repo:YOUR_ORG/YOUR_REPO:ref:refs/heads/main",
		"repo:YOUR_ORG/YOUR_REPO:pull_request"
	]
}
```

Replace `YOUR_ORG/YOUR_REPO` with the actual GitHub owner and repository. Add the role ARN as the repository secret `AWS_ROLE_TO_ASSUME`.

## Required GitHub secrets

- `AWS_ROLE_TO_ASSUME`
- `AWS_REGION`
- `AMI_ID`
- `SUBNET_ID`
- `KEY_NAME`

These are used by the GitHub Actions pipeline to run Terraform plan and apply.
