# # create API is called main
# resource "aws_apigatewayv2_api" "this" {
#   name          = "crommie"
#   protocol_type = "HTTP"
# }


# # access log setting that writes to a CloudWatch log. 
# # The CloudWatch log group has a retention period of 30 days.
# resource "aws_cloudwatch_log_group" "this" {
#   name = "/aws/api-gw/${aws_apigatewayv2_api.this.name}"

#   retention_in_days = 30
# }

# # deployment for the API Gateway v2 API
# resource "aws_apigatewayv2_stage" "this" {
#   api_id = aws_apigatewayv2_api.this.id

#   name        = "crommie"
#   auto_deploy = true

#   access_log_settings {
#     destination_arn = aws_cloudwatch_log_group.this.arn

#     format = jsonencode({
#       requestId               = "$context.requestId"
#       sourceIp                = "$context.identity.sourceIp"
#       requestTime             = "$context.requestTime"
#       protocol                = "$context.protocol"
#       httpMethod              = "$context.httpMethod"
#       resourcePath            = "$context.resourcePath"
#       routeKey                = "$context.routeKey"
#       status                  = "$context.status"
#       responseLength          = "$context.responseLength"
#       integrationErrorMessage = "$context.integrationErrorMessage"
#       }
#     )
#   }
# }


# # specifies the integration between the API Gateway and the Lambda function
# resource "aws_apigatewayv2_integration" "this" {
#   api_id = aws_apigatewayv2_api.this.id

#   integration_type = "AWS_PROXY"
#   integration_uri  = aws_lambda_function.this.invoke_arn
# }

# # defines the route for the API Gateway. 
# # The route_key specifies the HTTP method and path for the route
# resource "aws_apigatewayv2_route" "this" {
#   api_id    = aws_apigatewayv2_api.this.id
#   route_key = "GET /crommie"

#   target = "integrations/${aws_apigatewayv2_integration.this.id}"
# }

# # allows the API Gateway to invoke the Lambda function
# resource "aws_lambda_permission" "this" {
#   statement_id  = "AllowExecutionFromAPIGateway"
#   action        = "lambda:InvokeFunction"
#   function_name = aws_lambda_function.this.function_name
#   principal     = "apigateway.amazonaws.com"

#   source_arn = "${aws_apigatewayv2_api.this.execution_arn}/*/*"
# }
