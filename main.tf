terraform {
  required_version = ">= 1.9.8" # Adjust the version based on your requirements
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.73.0" # Use the appropriate version constraint
    }
  }
}

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

terraform {
  backend "s3" {
    bucket         = "karamterraformstatebucket"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-northeast-1" //can not be a variable in backend code block
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

module "ec2" {
  source        = "./modules/ec2-instance"
  environment = var.environment
}