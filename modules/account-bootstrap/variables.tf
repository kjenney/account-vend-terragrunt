variable "iam_user_name" {
  description = "Name of the IAM user to create in the new account."
  type        = string
}

variable "minimum_password_length" {
  description = "Minimum password length."
  type        = number
  default     = 14
}

variable "require_lowercase_characters" {
  description = "Require at least one lowercase character."
  type        = bool
  default     = true
}

variable "require_uppercase_characters" {
  description = "Require at least one uppercase character."
  type        = bool
  default     = true
}

variable "require_numbers" {
  description = "Require at least one number."
  type        = bool
  default     = true
}

variable "require_symbols" {
  description = "Require at least one symbol."
  type        = bool
  default     = true
}

variable "allow_users_to_change_password" {
  description = "Allow users to change their own password."
  type        = bool
  default     = true
}

variable "hard_expiry" {
  description = "Prevent users from setting a new password after expiry without admin reset."
  type        = bool
  default     = false
}

variable "max_password_age" {
  description = "Number of days before passwords expire. 0 means no expiration."
  type        = number
  default     = 90
}

variable "password_reuse_prevention" {
  description = "Number of previous passwords users are prevented from reusing."
  type        = number
  default     = 24
}
