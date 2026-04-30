terraform {
  backend "s3" {
    bucket         = "yourname-devops-state-ap-south-1"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}