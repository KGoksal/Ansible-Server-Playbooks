// This Terraform Template creates 4 Ansible Machines on EC2 Instances
// Ansible Machines will run on Amazon Linux 2023 and Ubuntu 22.04 with a custom security group
// allowing SSH (22) and HTTP (80) connections from anywhere.
// The user needs to select the appropriate key name when launching the instance.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" // Using HashiCorp's AWS provider
      version = "~> 5.0" // Specifying provider version
    }
  }
}

provider "aws" {
  region = "us-east-1" // AWS region to deploy resources
  // Uncomment and set your AWS credentials securely
  // secret_key = var.aws_secret_key
  // access_key = var.aws_access_key
}

// Resource block to create three Amazon Linux 2 instances
resource "aws_instance" "amazon-linux-2" {
  ami = var.amznlnx2023 // Amazon Linux 2023 AMI ID
  instance_type = var.instype // Instance type (e.g., t2.micro)
  count = 3 // Number of instances to create
  key_name = var.mykey // SSH key name for accessing instances
  vpc_security_group_ids = [aws_security_group.tf-sec-gr.id] // Security group ID
  tags = {
    Name = element(var.tags, count.index) // Assigning dynamic names from tags variable
  }
}

// Resource block to create one Ubuntu 22.04 instance
resource "aws_instance" "ubuntu" {
  ami = var.ubuntu // Ubuntu 22.04 AMI ID
  instance_type = var.instype // Instance type (e.g., t2.micro)
  key_name = var.mykey // SSH key name for accessing instances
  vpc_security_group_ids = [aws_security_group.tf-sec-gr.id] // Security group ID
  tags = {
    Name = "node_3" // Assigning a fixed name
  }
}

// Data block to reference the default VPC
data "aws_vpc" "default" {
  default = true
}

// Security group to allow SSH (22) and HTTP (80) from anywhere
resource "aws_security_group" "tf-sec-gr" {
  name = "ansible-session-sec-gr-${var.user}" // Security group name with dynamic user variable
  vpc_id = data.aws_vpc.default.id // VPC ID

  tags = {
    Name = "ansible-session-sec-gr"
  }

  ingress {
    from_port   = 80 // HTTP port
    protocol    = "tcp" // Protocol type
    to_port     = 80 // HTTP port
    cidr_blocks = ["0.0.0.0/0"] // Allowing from anywhere
  }

  ingress {
    from_port   = 22 // SSH port
    protocol    = "tcp" // Protocol type
    to_port     = 22 // SSH port
    cidr_blocks = ["0.0.0.0/0"] // Allowing from anywhere
  }

  egress {
    from_port   = 0 // Allow all outbound traffic
    protocol    = -1 // Protocol type (all)
    to_port     = 0 // Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"] // Allowing to anywhere
  }
}