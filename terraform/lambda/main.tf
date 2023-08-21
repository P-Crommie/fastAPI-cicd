resource "aws_lambda_function" "this" {
  function_name    = var.lambda_name
  s3_bucket        = var.s3bucket
  s3_key           = var.s3buckek_key
  handler          = var.lambda_handler
  role             = aws_iam_role.this.arn
  runtime          = var.lambda_runtime
  source_code_hash = data.aws_s3_object.this.etag
}

resource "aws_lambda_function_url" "this" {
  function_name      = aws_lambda_function.this.function_name
  authorization_type = "NONE"
}
