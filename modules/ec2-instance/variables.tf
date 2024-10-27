variable "instance_type" { default = "t2.micro" }
variable "ami" { default = "ami-03f584e50b2d32776" }
variable "environment" {
  description = "env"
  type        = string
}