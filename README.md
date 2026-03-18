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

To assume the first role in `ASSUME_ROLE_ARNS` using the provisioned IAM user credentials:

```
export AWS_ACCESS_KEY_ID=$(terragrunt --working-dir infrastructure/account-bootstrap output -raw iam_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(terragrunt --working-dir infrastructure/account-bootstrap output -raw iam_secret_access_key)

ROLE_ARN=$(echo $ASSUME_ROLE_ARNS | cut -d',' -f1)
CREDS=$(aws sts assume-role --role-arn "$ROLE_ARN" --role-session-name bootstrap-session)

export AWS_ACCESS_KEY_ID=$(echo $CREDS | jq -r '.Credentials.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(echo $CREDS | jq -r '.Credentials.SecretAccessKey')
export AWS_SESSION_TOKEN=$(echo $CREDS | jq -r '.Credentials.SessionToken')
```
