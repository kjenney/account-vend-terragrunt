resource "aws_iam_user" "this" {
  name = var.iam_user_name
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_iam_user_policy_attachment" "admin" {
  user       = aws_iam_user.this.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_account_password_policy" "this" {
  minimum_password_length        = var.minimum_password_length
  require_lowercase_characters   = var.require_lowercase_characters
  require_uppercase_characters   = var.require_uppercase_characters
  require_numbers                = var.require_numbers
  require_symbols                = var.require_symbols
  allow_users_to_change_password = var.allow_users_to_change_password
  hard_expiry                    = var.hard_expiry
  max_password_age               = var.max_password_age
  password_reuse_prevention      = var.password_reuse_prevention
}
