provider "aws" {
  region = var.mumbai_region
}

resource "aws_instance" "myInst1" {
  ami = var.ami_linux_mumbai
  instance_type = "t3.micro"
  key_name = var.key_pair_name
  vpc_security_group_ids = ["sg-086a84e1169fba374"]

  # add user data to create a simple web page (it will be run be root user)
  user_data = <<-EOF
              #!/bin/bash
              yum install -y httpd
              systemctl start httpd
              echo "Hello World from Terraform" > /var/www/html/index.html
              EOF

  #user_data = file("user-data.sh")

  tags = {
    Name = "user-data"
  }
}