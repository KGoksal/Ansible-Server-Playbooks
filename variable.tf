// Variable definitions for the Terraform configuration

 
variable "tags" {
  default = ["control_node", "node_1", "node_2"] // Tags for instances
}

variable "mykey" { 
  default = "your_key" // SSH key name 
} 

variable "user" {
  default = "your_user" // User variable for dynamic resource names
}

variable "amznlnx2023" {
  default = "ami-07caf09b362be10b8" // Amazon Linux 2023 AMI ID
}

variable "ubuntu" {
  default = "ami-04b70fa74e45c3917" // Ubuntu 22.04 LTS AMI ID
}

variable "instype" {
  default = "t2.micro" // Instance type
}

// Uncomment and set your AWS credentials securely
// variable "aws_secret_key" {
//   default = "xxxxx"
// }

// variable "aws_access_key" {
//   default = "xxxxx"
// }
