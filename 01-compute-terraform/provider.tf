provider "aws" {
  region  = var.aws_region
  profile = "default" #check your profile in .aws/credentials
}