// this is the backend configuration, which is used to store the terraform state file in S3 bucket.
// first create the bucket in AWS and then use its name here.
terraform {
  backend "s3" {
    bucket = "nik-backup-123"   //bucket name
    key = "terraform.tfstate"   //file name in the bucket
    region = "ap-south-1"       //region of the bucket(no variables allowed here)
  }
}
//now your .tfstate file will be stored in the S3 bucket, not in local directory.
//and you can access it from anywhere using the same bucket and key.
//you have to run terraform init command again to initialize the backend and migrate the state file to S3 bucket.

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "MyInst" {
  ami = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ data.aws_security_group.my-sg.id ]
  tags = {
    Name = "web-server"
  }
}

// this is data block, which is used to fetch the existing resource details from AWS
// so that we can use its ID in our instance resource.
data "aws_security_group" "my-sg" {
  name = "my-sg"
  vpc_id = "vpc-07ef61a1e6056270d"
}
// remenber, this is for ONLY READING/USING the existing resource, we cannot manage it using terraform
// we cannot create or modify the resource using data block