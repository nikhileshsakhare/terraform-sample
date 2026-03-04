provider "aws" {
  region = "ap-south-1"
}

# try for s3, create a bucket and upload a file to it using terraform
resource "aws_s3_bucket" "nik_bucket" {
  bucket = "nik-bucket-2003"
  tags = {
    Name = "nik-bucket"
  }
}

resource "aws_s3_object" "my_file" {
  bucket = aws_s3_bucket.nik_bucket.bucket
  key    = "sample.txt"     // this is the name of the file in the bucket
  source = "sample.txt"     // this is the path of the file in our local machine
}

# now try for ebs, create a volume and attach it to an instance using terraform
resource "aws_ebs_volume" "my_volume" {
  availability_zone = "ap-south-1a"
  size = 10                         // size in GB
  tags = {
    Name = "myVolume"
  }
}

resource "aws_instance" "nik_instance" {
  ami           = "ami-051a31ab2f4d498f5"
  instance_type = "t3.micro"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "nik_instance"
  }
}

// we need to use another resource to attach the volume to the instance
// we cannot do it in the aws_instance resource itself
resource "aws_volume_attachment" "attach_nik" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.my_volume.id
  instance_id = aws_instance.nik_instance.id
}