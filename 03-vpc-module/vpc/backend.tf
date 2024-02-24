terraform {
  backend "s3" {
    bucket = "class21-devops"
    key    = "vpc/terraform.tfstate"
    region = "ca-central-1"
  }
}