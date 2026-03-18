resource "aws_organizations_account" "this" {
  name                       = var.name
  email                      = var.email
  role_name                  = var.role_name
  iam_user_access_to_billing = var.iam_user_access_to_billing
  parent_id                  = var.parent_id

  lifecycle {
    # These fields are set at creation time and cannot be changed afterwards.
    # AWS does not support deleting accounts via API; removal from state only.
    ignore_changes = [
      name,
      role_name,
      iam_user_access_to_billing,
      parent_id,
    ]
  }
}
