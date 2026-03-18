# account-vend-terragrunt

Terragrunt to deploy a new AWS account in an AWS organization and provosion an IAM user to manage the account.

## Quick Start

1. `cp .env-example .env`
2. Change the values in `.env` to match your environment
3. Run:

```
source .env
terragrunt run --all apply
```