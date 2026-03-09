// this file contains the output block to display the required content what we want to see on terminal after terraform apply command is executed successfully.
// In this case we want to see the public IP address of the EC2 instance created by terraform.4

output "public-ip-addr" {
  description = "Public IP address of the EC2 instance"
  value = aws_instance.myInst1.public_ip
}