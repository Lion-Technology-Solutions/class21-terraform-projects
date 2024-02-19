terraform {
  backend "s3" {
    bucket = "class21-devops"
    region = "ca-central-1"
    key    = "class21-terraform-state/terraform.tfstate"
  }
}