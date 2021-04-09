module "lambda-sample" {
  # using azdo as a source
  # source = "git::https://dev.azure.com/ihsmarkit/octo/_git/terraform-modules//aws/lambda"

  # using gitlab as a source
  # source = "git::https://git.mdevlab.com/octo/terraform-modules.git//aws/lambda"

  # do not use this source -- this is for local testing only
  source = "../../lambda"

  # required variables
  name       = "sampleLambda"
  source_dir = "./function"
  handler    = "lambda_function.lambda_handler"
  runtime    = "python3.8"
  policy_arns = ["arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole",
                 "arn:aws:iam::aws:policy/AmazonEC2FullAccess"  
                  ]
  tags = { "Example" = "some-value" } # the tags to apply to all resources

  # optional variables  
  memory_size=  128
  timeout    =  60
  description=  "description for lambda"
  policy_documents = []   #put policy document in json format if you need to attach any inline policy
  enable_cloudwatchevent_trigger = false       
  schedule_expression = "cron(0 1 * * ? *)"   #The scheduling expression. For example, cron(0 20 * * ? *) or rate(5 minutes).

}