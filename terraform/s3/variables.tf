variable "project" {
  default = "fast-api-lambda-bucket"
}

variable "lifecycle_id" {
  default = "test-policy"
}

variable "lifecycle_status" {
  default = "Enabled"
}

variable "lifecycle_transition_1_days" {
  default = 30
}

variable "lifecycle_transition_1_storage_class" {
  default = "STANDARD_IA"
}

variable "lifecycle_transition_2_days" {
  default = 60
}

variable "lifecycle_transition_2_storage_class" {
  default = "GLACIER"
}

variable "kms_deletion_window" {
  default = 30
}

