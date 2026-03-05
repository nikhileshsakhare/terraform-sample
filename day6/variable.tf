/*
This is the variable file where we will declare all the variables that we want to use in our main.tf file.
This is a good practice to keep our code organized and maintainable.
We can also assign default values to our variables here, so that we don't have to specify them every time we run our terraform code.
We don't change the file name, terraform will automatically recognize it and use the variables declared in this file.
We can also create multiple variable files if we want to, and terraform will use all of them.
We can also specify which variable file to use when we run our terraform code, but if we don't specify, terraform will use all the variable files it finds in the current directory.

Most of the time, we will use this file in companys as well, they will not give you access of main.tf file
*/

variable "mumbai_region" {
  default = "ap-south-1"
}

variable "ami_linux_mumbai" {
  default = "ami-051a31ab2f4d498f5"
}

variable "inst_type" {
  description = "Provide the Instance type for creation of the instance"
  type = string     // it will only except string type inputs
  // if we don't assing a default value to a variable, then it becomes a required variable
  // then we have to specify its value when we run our terraform code
  // it will also ask for value while destroying the infrastructure, but is it not needed
}

variable "inst_type_choice" {
  default = ["t3.micro", "t3.small"]
  type = list(string)   // it will only except list of string type inputs
}

// try each and every varable type and see how it works
variable "key_pair_name" {
  default = "nik-mumbai-key"
}