resource "aws_kms_key" "main" {
  description             = "KMS key for EKS secrets encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true

  tags = {
    Name = "secure-kms-key"
  }
}