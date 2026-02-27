provider "aws" {
  region = "ap-south-1"
}

/*
resource "aws_instance" "nik-1" {
  ami  = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  // if we canage the instance type, it will modify the existing instance
  // if we change the ami, it will destroy the existing instance and create a new one
  count = 4
  tags = {
    Name = "nik"
  }
}
*/

/*  this is not a good way to create multiple instance with different name
resource "aws_instance" "nik-2" {
  ami  = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  tags = {
    Name = "nik-1"
  }
}

resource "aws_instance" "nik-3" {
  ami  = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  tags = {
    Name = "nik-2"
  }
}
*/

/*  This is a good way to create multiple instance with different name using for_each and toset
resource "aws_instance" "nik-4" {
  for_each = toset(["proxy", "app", "db"])
  // for_each is used as a for loop and toset is used to convert the list to set
  ami  = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  tags = {
    Name = each.key     // each.key is used to get the value of the current iteration
  }
}
*/

/*
resource "aws_instance" "nik-5" {
  ami  = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  count = 4
  tags = {
    Name = "web-server-${count.index}"
    // count.index is used to get the index of the current iteration, it starts from 0
  }
}
*/

/*
resource "aws_instance" "nik-6" {
  ami  = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  key_name = "nik-mumbai-key"   //only name is enought, it will automatically find the key pair in the region
  tags = {
    Name = "web-server"
  }
}
*/

resource "aws_instance" "nik-6" {
  ami  = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ "sg-086a84e1169fba374" ] #need sg id here, not the name
  tags = {
    Name = "web-server"
  }
}

/* Generating SSH Key Pair using Terraform and using it to create an EC2 instance
# 1. Generate a Private Key (RSA)
resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
# 2. Register the Public Key with AWS
resource "aws_key_pair" "generated_key" {
  key_name   = "my-terraform-key"
  public_key = tls_private_key.my_key.public_key_openssh
}
# 3. Save the Private Key locally as a .pem file
resource "local_file" "ssh_key" {
  filename        = "/root/my-terraform-key.pem"
  content         = tls_private_key.my_key.private_key_pem
  file_permission = "0400"
}
# 4. Create the Instances using the generated key
resource "aws_instance" "nik-7" {
  ami  = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  key_name = aws_key_pair.generated_key.key_name
  tags = {
    Name = "web-server"
  }
}
*/