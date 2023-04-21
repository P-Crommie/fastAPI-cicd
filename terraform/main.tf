resource "aws_lambda_function" "this" {
  function_name    = "crommie-lambda-function"
  s3_bucket        = "crommie-s3"
  s3_key           = "api.zip"
  handler          = "main.handler"
  role             = aws_iam_role.lambda_exec.arn
  runtime          = "python3.7"
  source_code_hash = data.aws_s3_object.this.etag
}

resource "aws_lambda_function_url" "this" {
  function_name      = aws_lambda_function.this.function_name
  authorization_type = "NONE"
}
