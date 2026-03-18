variable "name" {
  description = "Friendly name for the member account."
  type        = string
}

variable "email" {
  description = "Email address of the owner for the new account. Must be globally unique."
  type        = string
}

variable "role_name" {
  description = "Name of the IAM role that AWS Organizations creates in the new account for cross-account access."
  type        = string
  default     = "OrganizationAccountAccessRole"
}

variable "iam_user_access_to_billing" {
  description = "Whether IAM users can access account billing. Valid values: ALLOW, DENY."
  type        = string
  default     = "ALLOW"

  validation {
    condition     = contains(["ALLOW", "DENY"], var.iam_user_access_to_billing)
    error_message = "Must be ALLOW or DENY."
  }
}

variable "parent_id" {
  description = "Parent Organizational Unit ID or Root ID for the account. If null, defaults to the organization root."
  type        = string
  default     = null
}
