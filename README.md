# account-vend-terragrunt

Terragrunt to deploy a new AWS account in an AWS organization and provosion an IAM user to manage the account.

## Quick Start

1. `cp .env-example .env`
2. Change the values in `.env` to match your environment
3. Run:

```
source .env
terragrunt run --all init
terragrunt run --all apply
```

To get the AWS credentials for the newly created IAM user run:

```
terragrunt --working-dir infrastructure/account-bootstrap output -raw iam_access_key_id
terragrunt --working-dir infrastructure/account-bootstrap output -raw iam_secret_access_key
```
