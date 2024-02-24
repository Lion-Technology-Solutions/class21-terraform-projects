module "ec2_instance" {
  source        = "./ec2_instance"
  region        = "ca-central-1"
  ami_id        = "ami-0d270005f18b0539a"
  instance_type = "t2.micro"
  key_name      = "NEXUS"
  subnet_id     = "subnet-012520fe87e70748e"
  instance_name = "class21"

}