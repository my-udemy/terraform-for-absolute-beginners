terraform {
  backend "s3" {
    bucket = "gvv-tfstate"
    key = "finance/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "gvv-tfstate-locks"
  }
}