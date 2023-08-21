# Add a lifecycle policy to transition objects to Standard-IA storage class after 30 days and to Glacier storage class after 60 days
resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.id
  rule {
    id = var.lifecycle_id
    filter {
      prefix = ""
    }
    status = var.lifecycle_status

    transition {
      days          = var.lifecycle_transition_1_days
      storage_class = var.lifecycle_transition_1_storage_class
    }

    transition {
      days          = var.lifecycle_transition_2_days
      storage_class = var.lifecycle_transition_2_storage_class
    }
  }
}
