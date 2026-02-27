provider "aws" {
  region = "ap-south-1"
  // create a user with admin access (for practicing purpose) and get the access key and secret key and give here
  // provide access_key and secret_key here of your user
  
  // don't directly give the access key and secret key in the code
  // github won't let you push the code with access key and secret key, it will show error
  // you can use environment variables or AWS credentials file to avoid this issue
  // or use IAM Role if you are using EC2 instance to run the terraform code
}

resource "aws_instance" "nik" {
  ami  = "ami-0dcc1e21636832c5d"      // need to give ami id here, not the name
  instance_type = "t3.micro"
  //count = 3                           // to create multiple instances
  // since we have created one instance aready, it will create 2 more instances and total will be 3 instances
  tags = {
    Name = "nik"                      // way to give name to the instance
  }
}