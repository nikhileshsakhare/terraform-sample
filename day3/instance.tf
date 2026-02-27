provider "aws" {
  region = "ap-south-1"
  // create a user with admin access (for practicing purpose) and get the access key and secret key and give here
}

/*
resource "aws_instance" "nik" {
  ami  = "ami-0dcc1e21636832c5d"
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
resource "aws_instance" "nik-1" {
  ami  = "ami-0dcc1e21636832c5d"
  instance_type = "t3.micro"
  tags = {
    Name = "nik-1"
  }
}

resource "aws_instance" "nik-2" {
  ami  = "ami-0dcc1e21636832c5d"
  instance_type = "t3.micro"
  tags = {
    Name = "nik-2"
  }
}
*/

resource "aws_instance" "nik" {
  for_each = toset(["proxy", "app", "db"])
  // for_each is used as a for loop and toset is used to convert the list to set
  ami  = "ami-0dcc1e21636832c5d"
  instance_type = "t3.micro"
  tags = {
    Name = each.key     // each.key is used to get the value of the current iteration
  }
}