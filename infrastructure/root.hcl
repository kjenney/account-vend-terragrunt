locals {
  management_account_id = get_env("MANAGEMENT_ACCOUNT_ID")
}

remote_state {
  backend      = "s3"
  config = {
    bucket               = "terraform-state-${local.management_account_id}"
    key                  = "${path_relative_to_include()}/terraform.tfstate"
    region               = "us-east-1"
    encrypt              = true
    bucket_sse_algorithm = "AES256"
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

