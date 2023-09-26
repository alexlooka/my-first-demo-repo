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
  type = list
  default = ["sg-0e2ddc835044f6eff"]
}


resource "aws_instance" "my-assighment-instance" {
  ami           = var.image_id
  instance_type = var.ec2_type
  vpc_security_group_ids = var.http_sg_id

  tags = {
    Name = "My-Terraform-Instance-1"
  }
}