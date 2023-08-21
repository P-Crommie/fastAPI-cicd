variable "s3buckek_key" {
  default = "api.zip"
}

variable "lambda_name" {
  default = "crommie-lambda"
}

variable "s3bucket" {
  default = "fast-api-lambda-bucket"
}

variable "lambda_handler" {
  default = "main.handler"
}

variable "lambda_runtime" {
  default = "python3.7"
}
