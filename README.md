# account-vend-terragrunt

Terragrunt to deploy a new AWS account in an AWS organization and provosion an IAM user to manage the account.

## Run it

See `.env-example` for the environment variables that need to be passed to Terragrunt. Copy `.env.example` to `.env`, change the values to match your environment and run:

```
source .env
terragrunt run-all apply
```