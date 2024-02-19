terraform {
  backend "s3" {
    bucket = "class21-devops"
    region = "ca-central-1"
    key    = "vpc+ec2/terraform.tfstate"
  }
}