output "iam_user_name" {
  description = "Name of the IAM user created in the new account."
  value       = aws_iam_user.this.name
}

output "iam_user_arn" {
  description = "ARN of the IAM user created in the new account."
  value       = aws_iam_user.this.arn
}

# WARNING: secret is stored in plaintext in Terraform state.
# Ensure your state backend is encrypted and access-controlled.
output "iam_access_key_id" {
  description = "Access key ID for the IAM user."
  value       = aws_iam_access_key.this.id
}

output "iam_secret_access_key" {
  description = "Secret access key for the IAM user."
  value       = aws_iam_access_key.this.secret
  sensitive   = true
}
