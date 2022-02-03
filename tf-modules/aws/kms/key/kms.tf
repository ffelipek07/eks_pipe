resource "aws_kms_key" "custom" {  
  description = var.kms-key-description  
  tags = {    
    Name        = var.kms-key-name
    Environment = var.environment
    Platform    = "KMS"
    Type        = "KEY"
  }
}