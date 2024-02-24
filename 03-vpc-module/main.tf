module "vpc" {
  source         = "./vpc"
  vpc_cidr_block = "10.0.0.0/16"
  region         = "ca-central-1"
  vpc_name       = "class21"
}