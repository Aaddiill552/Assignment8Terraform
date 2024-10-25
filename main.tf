provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "karamterraformstatebucket"
  
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# terraform {
#   backend "s3" {
#     bucket         = "karamterraformstatebucket"
#     key            = "global/s3/terraform.tfstate"
#     region         = "ap-northeast-1" //can not be a variable in backend code block
#     dynamodb_table = "terraform-locks"
#     encrypt        = true
#   }
# }

module "ec2" {
  source        = "./modules/ec2-instance"
}