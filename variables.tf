variable aws_region {
    default = "ap-northeast-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami" {
  type    = string
  default = "ami-03f584e50b2d32776"
}