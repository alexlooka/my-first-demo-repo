terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
variable "ec2_type" {
  type = string
  default = "t2.micro"
}

variable "image_id" {
  type = string
  default = "ami-03a6eaae9938c858c"
}

variable "http_sg_id" {
  type = string
  default = "sg-0e2ddc835044f6eff"
}


resource "aws_instance" "my-assighment-instance" {
  ami           = "ami-03a6eaae9938c858c"
  instance_type = "t2.micro"
  security_groups = "sg-0e2ddc835044f6eff"

  tags = {
    Name = "My-Terraform-Instance-1"
  }
}