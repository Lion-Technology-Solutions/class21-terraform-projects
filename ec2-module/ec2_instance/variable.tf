variable "region" {
  description = "The AWS REGION"

}

variable "ami_id" {
  description = "The AMI ID OF OS"

}

variable "instance_type" {
  description = "the instance type [ t2.micro, t3.micro]"

}

variable "key_name" {
  description = "ssh keypair used to launched instance"

}

variable "subnet_id" {
  description = "the specific subnets"
}

variable "instance_name" {
  description = "the instance name"

}

