provider "aws" {
  region = "ap-south-1"
}


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

//add keypair and security group to the instance