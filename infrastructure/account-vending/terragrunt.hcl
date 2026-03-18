include "root" {
  path = find_in_parent_folders("root.hcl")
}

# https://github.com/tmknom/terraform-aws-organizations-account
terraform {
  source = "git::https://github.com/tmknom/terraform-aws-organizations-account.git//?ref=e32f35b"
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