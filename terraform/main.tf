resource "aws_lambda_function" "my_lambda_function" {
  function_name    = "crommie-lambda-function"
  handler          = "main.handler"
  role             = aws_iam_role.lambda_exec.arn
  runtime          = "python3.7"
  source_code_hash = data.aws_s3_bucket_object.this.etag
}

