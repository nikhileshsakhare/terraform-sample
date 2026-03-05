// this is the terraform.tfvars file, which is alternative for varables.tf file
// but this file is high priority than variables.tf file
// if we have same variable declared in both files, then terraform will use the value from terraform.tfvars file

inst_type = "c7i-flex.large" // this is also an free tier instance type