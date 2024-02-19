provider "aws" {
  region  = "us-east-1"
  profile = "default"
}

resource "aws_instance" "ec2" {
  ami           = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  key_name      = "slaves"
  // security_groups = ["class21-sg"]
  vpc_security_group_ids = ["${aws_security_group.class21-sg.id}"]
  subnet_id              = aws_subnet.class21-subnet.id
}

resource "aws_security_group" "class21-sg" {
  name   = "class21-sg"
  vpc_id = aws_vpc.class21-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-sg"

  }

}

//creating a VPC
resource "aws_vpc" "class21-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "rpt03-vpc"
  }

}

// Creatomg a Subnet 
resource "aws_subnet" "class21-subnet" {
  vpc_id                  = aws_vpc.class21-vpc.id
  cidr_block              = "10.1.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"
  tags = {
    Name = "class21-subnet"
  }

}

//Creating a Internet Gateway 
resource "aws_internet_gateway" "class21-igw" {
  vpc_id = aws_vpc.class21-vpc.id
  tags = {
    Name = "class21-igw"
  }
}

// Create a route table 
resource "aws_route_table" "class21-rt" {
  vpc_id = aws_vpc.class21-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.class21-igw.id
  }
  tags = {
    Name = "class21-rt"
  }
}

// Associate subnet with routetable 

resource "aws_route_table_association" "class21-rta" {
  subnet_id      = aws_subnet.class21-subnet.id
  route_table_id = aws_route_table.class21-rt.id

}