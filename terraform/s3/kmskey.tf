# Create a KMS key and an alias
resource "aws_kms_key" "this" {
  description             = var.project
  deletion_window_in_days = var.kms_deletion_window
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.project}-key"
  target_key_id = aws_kms_key.this.key_id
}
