module "scheduled-event-lambda" {
  count                = var.enable_cloudwatchevent_trigger ? 1 : 0
  source               = "../scheduled-event-lambda"
  function_arn         = aws_lambda_function.lambda.arn
  schedule_expression  = var.schedule_expression
  schedule_name        = "${var.name}-lambda-event"
  schedule_description = "Specifies event for trriger ${var.name} lambda function"
}
