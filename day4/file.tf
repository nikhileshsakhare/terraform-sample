provider "aws" {
  region = "ap-south-1"
}

resource "aws_security_group" "nik-sg" {
  name        = "nik-security-group"                //if not given, it will be generated with random string
  //if we change the name, it will create a new security group and delete the old one
  //it will automatically update the security group id in the aws_instance resource as well
  //but it will never get destroyed..., we need to use lifecycle block to prevent this (used below)
  description = "Security group for nik instance"
  vpc_id      = "vpc-07ef61a1e6056270d"             //if not given, it will be created in default vpc

  ingress {                         // for inbound rules
    description = "Allow SSH access from anywhere"
    from_port   = 22                // port number for ssh
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow HTTP access from anywhere"
    from_port   = 80                // port number for http
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {                          // for outbound rules (all traffic allowed)
    from_port   = 0                 // all ports
    to_port     = 0
    protocol    = "-1"              // all protocols
    cidr_blocks = ["0.0.0.0/0"]     // anywhere can access this port
  }

  lifecycle {
    create_before_destroy = true
    // do this or else it will try to destroy the security group before creating a new one
    // which will cause an error because the instance is still using the old security group
  }
}

resource "aws_instance" "nik-1" {
  ami  = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  key_name = "nik-mumbai-key"
  vpc_security_group_ids = [aws_security_group.nik-sg.id]  // reference to the security group created above
  tags = {
    Name = "nik-1"
  }
}