# Terraform deployment

The GitHub Actions workflow in `.github/workflows/terraform-apply.yml` runs
`terraform plan` and applies it when changes to `infra/` are pushed to `main`.
It can also be started manually from the Actions tab.

## GitHub configuration

Configure these repository settings before running the workflow:

- **Secret** `AWS_ROLE_ARN`: ARN of an AWS IAM role that GitHub Actions can
  assume using GitHub's OIDC provider. The role trust policy must allow this
  repository's `token.actions.githubusercontent.com` subject and audience.
- **Variable** `TF_STATE_BUCKET`: name of an existing S3 bucket for Terraform
  state. Enable bucket versioning and block public access.
- **Variable** `AWS_REGION` (optional): deployment and state bucket region;
  defaults to `us-east-1`.

The role needs permissions to read/write the configured S3 state object and
state lock file, as well as permissions to manage the AWS resources declared
in `infra/`. The backend stores state at
`testeGit/infra/terraform.tfstate` and uses S3 native locking.