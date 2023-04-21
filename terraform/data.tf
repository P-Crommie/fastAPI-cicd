data "aws_s3_bucket_object" "this" {
  bucket = "crommie-s3"
  key    = "api.zip"
}
