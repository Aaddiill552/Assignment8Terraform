variable aws_region {
  type = string
  default = "ap-northeast-1"
}

variable "environment" {
  # default = "dev"
  description = "env"
  type        = string
}