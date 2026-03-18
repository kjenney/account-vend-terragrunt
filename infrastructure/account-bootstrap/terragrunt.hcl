include "root" {
  path = find_in_parent_folders()
}

# Pull the new account ID from the account-vending module output
dependency "account" {
  config_path = "../account-vending"

  # Allows plan to work before account-vending has been applied
  mock_outputs = {
    account_id = "000000000000"
  }
  mock_outputs_allowed_terraform_commands = ["plan", "validate"]
}

# Dynamically generate a provider that assumes role into the new account
generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn = "arn:aws:iam::${dependency.account.outputs.account_id}:role/OrganizationAccountAccessRole"
  }
}
EOF
}

# https://github.com/terraform-aws-modules/terraform-aws-iam/tree/master/modules/iam-account
terraform {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-iam.git//modules/iam-account?ref=v6.4.0"
}

locals {
  account_alias = get_env("ACCOUNT_ALIAS")
}

inputs = {
  # Sets the IAM account alias (used in the AWS sign-in URL)
  account_alias = local.account_alias

  # Password policy settings
  create_account_password_policy  = true
  minimum_password_length         = 14
  require_lowercase_characters    = true
  require_uppercase_characters    = true
  require_numbers                 = true
  require_symbols                 = true
  allow_users_to_change_password  = true
  hard_expiry                     = false
  max_password_age                = 90
  password_reuse_prevention       = 24
}