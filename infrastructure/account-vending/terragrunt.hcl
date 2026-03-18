include "root" {
  path = find_in_parent_folders("root.hcl")
}

# Provider runs in the management account
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}

terraform {
  source = "${get_repo_root()}/modules/account-vending"
}

locals {
  account_name  = get_env("ACCOUNT_NAME")
  account_email = get_env("ACCOUNT_EMAIL")
}

inputs = {
  name  = local.account_name
  email = local.account_email

  # IAM role automatically created in the new account for cross-account access
  role_name = "OrganizationAccountAccessRole"

  # Allow IAM users in the new account to access billing information
  iam_user_access_to_billing = "ALLOW"
}