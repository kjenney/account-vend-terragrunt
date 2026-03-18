output "account_id" {
  description = "AWS account ID of the new member account."
  value       = aws_organizations_account.this.id
}

output "account_arn" {
  description = "ARN of the new member account."
  value       = aws_organizations_account.this.arn
}

output "account_name" {
  description = "Friendly name of the new member account."
  value       = aws_organizations_account.this.name
}
