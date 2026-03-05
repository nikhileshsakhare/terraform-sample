provider "aws" {
  // region = "ap-south-1"    // this is a hardcoded value
  region = var.mumbai_region  // this is a variable reference, we are using the variable declared in the variable.tf file
}

/*  // this is a hardcoded way
resource "aws_instance" "myInstance" {
  ami = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  key_name = "nik-mumbai-key"
  vpc_security_group_ids = ["sg-086a84e1169fba374"]
  tags = {
    Name = "web-server"
  }
}
*/

// this is the variable reference way
resource "aws_instance" "myInstance" {
  ami = var.ami_linux_mumbai
  #instance_type = var.inst_type            // it will ask value at runtime (provide t3.micro)
  instance_type = var.inst_type_choice[0]   // it will take the n'th value from the list (t3.micro)
  key_name = var.key_pair_name
  vpc_security_group_ids = ["sg-086a84e1169fba374"]
  tags = {
    Name = "web-server"
  }
}