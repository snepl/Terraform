# Configure the AWS Provider
provider "aws" {
  profile = "xyz"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "demo-terraform-eks-state-bucket-0"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "terraform-eks-state-locks-0"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  

  attribute {
    name = "LockID"
    type = "S"
  }

}
