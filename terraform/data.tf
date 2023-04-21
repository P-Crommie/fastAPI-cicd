data "aws_s3_object" "this" {
  bucket = "crommie-s3"
  key    = "api.zip"
}
