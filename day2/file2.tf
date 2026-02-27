provider "aws" {
  region = "ap-south-1"
  // create an IAM role for ec2 instance, give it admin access (for now), and attach it to your instance
  // or else you need to give access_key and secret_key of your user in the provider block to run the terraform code
  // but then you can't push this code to your github repository, it will throw some errors
}

resource "aws_instance" "nik" {
  ami  = "ami-051a31ab2f4d498f5"      // need to give ami id here, not the name
  instance_type = "t3.micro"
  //count = 3                           // to create multiple instances
  // since we have created one instance aready, it will create 2 more instances and total will be 3 instances
  tags = {
    Name = "nik"                      // way to give name to the instance
  }
}