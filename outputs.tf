output "instance_id" {
  description = "The ID of the EC2 instance from the module"
  value       = module.ec2.instance_id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = module.ec2.instance_public_ip
}

output "s3_bucket_name" {
  description = "The name of the S3 bucket for state storage"
  value       = aws_s3_bucket.terraform_state.bucket  
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table for state locking"
  value       = aws_dynamodb_table.terraform_locks.name
}
