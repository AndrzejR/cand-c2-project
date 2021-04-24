# TODO: Designate a cloud provider, region, and credentials
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.37"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2

variable "T2_instances_list" {
  description = "List of instances to create"
  type        = list(string)
  default     = ["T2_1", "T2_2", "T2_3", "T2_4"]
}

resource "aws_instance" "Udacity_T2" {
  count         = length(var.T2_instances_list)
  ami           = "ami-0db9040eb3ab74509"
  instance_type = "t2.micro"
  subnet_id     = "subnet-001593bbdfa10c736"

  tags = {
    Name = "Udacity T2"
  }
}


# TODO: provision 2 m4.large EC2 instances named Udacity M4

# variable "M4_instances_list" {
#   description = "List of instances to create"
#   type        = list(string)
#   default     = ["M4_1", "M4_2"]
# }

# resource "aws_instance" "Udacity_M4" {
#   count         = length(var.M4_instances_list)
#   ami           = "ami-0db9040eb3ab74509"
#   instance_type = "m4.large"
#   subnet_id     = "subnet-001593bbdfa10c736"

#   tags = {
#     Name = "Udacity M4"
#   }
# }