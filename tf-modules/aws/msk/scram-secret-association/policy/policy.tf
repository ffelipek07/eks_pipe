resource "aws_secretsmanager_secret_policy" "msk-custom-policy" {
  secret_arn = var.msk-secret-arn
  policy     = <<POLICY
{
  "Version" : "2012-10-17",
  "Statement" : [ {
    "Sid": "AWSKafkaResourcePolicy",
    "Effect" : "Allow",
    "Principal" : {
      "Service" : "kafka.amazonaws.com"
    },
    "Action" : "secretsmanager:getSecretValue",
    "Resource" : "${var.msk-secret-arn}"
  } ]
}
POLICY
}