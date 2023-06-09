resource "aws_lambda_function" "build_function" {
  function_name   = "${var.lambda_name}-${var.env_name}"
  description     = "Lambda funtion created using terraform"
  timeout         = var.timeout
  package_type    = "zip"
  runtime         = "xyz"
  memory_size     = var.memory_size
  role            = aws_iam_role.aws-lambda-role.arn
  handler         = "index.test"
  filename        = "test.zip"
  vpc_config {
    subnet_ids    = var.subnet_ids
    security_group_ids = [aws_security_group.aws_sg.id]
  }
  tags            = var.tags
}
