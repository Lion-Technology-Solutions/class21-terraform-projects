provider "aws" {

 profile = "default"
 region    =  var.region  
}

resource "aws_vpc" "main" {
 cidr_block = var.vpc_cidr_block
 tags =  { 
  Name  = var.vpc_name 
 }  

}

resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id   
 tags =  {    
  Name  = "${var.vpc_name}-gw"
 }
  
}