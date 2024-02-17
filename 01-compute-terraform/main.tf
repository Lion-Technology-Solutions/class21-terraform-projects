resource "aws_instance" "class21-demo" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  vpc_security_group_ids = ["sg-0fbc35dddaffb0a7a"] #replace this value with your own security
}


  

// ami 
// instance_type 
// availability_zone