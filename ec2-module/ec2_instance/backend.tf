terraform {
  backend "s3" {
    bucket = "class21-devops"
    key    = "ec2-module/terraform.tfstate"
    region = "ca-central-1"
  }
}