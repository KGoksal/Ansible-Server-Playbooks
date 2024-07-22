# Ansible Practice Infrastructure with Terraform

This repository contains Terraform and Ansible configurations to set up a practice environment for learning and testing Ansible automation on AWS EC2 instances.

## Files Overview

- **main.tf**: Terraform configuration file to provision AWS EC2 instances for Ansible practice.
- **variables.tf**: Defines input variables used in `main.tf`.
- **inventory.txt**: Ansible inventory file specifying hosts and their configuration for Ansible playbooks.
- **ansible.cfg**: Ansible configuration file with custom settings for this practice environment.

## Configuration Details

### Terraform (main.tf, variables.tf)

- **main.tf**: 
  - Defines AWS provider and resources (`aws_instance` and `aws_security_group`) necessary to create EC2 instances.
  - Uses variables for AMI IDs, instance type, key name, and tags for EC2 instances.
  - Security groups allow SSH (port 22) and HTTP (port 80) access from anywhere.

- **variables.tf**: 
  - Contains variable definitions used in `main.tf`, such as AMI IDs, instance type, tags, and AWS credentials (commented out for security reasons; use environment variables or other secure methods).

### Ansible (inventory.txt, ansible.cfg)

- **inventory.txt**: 
  - Ansible inventory file specifying hosts (`node1`, `node2`, etc.) with their private IP addresses and SSH user (`ec2_user`).
  - Uses `[web-servers]` group for targeting in Ansible playbooks.

- **ansible.cfg**: 
  - Ansible configuration file with custom settings:
    - `host_key_checking = False`: Disables SSH host key checking to avoid prompts.
    - `inventory = inventory.txt`: Specifies the inventory file for Ansible.
    - `deprecation_warnings = False`: Suppresses deprecation warnings for cleaner output.
    - `interpreter_python = auto_silent`: Automatically detects and uses the Python interpreter on target hosts without verbose output.

## Usage

1. **Prerequisites**:
   - Ensure you have Terraform installed locally (`terraform --version`).
   - AWS CLI configured with appropriate credentials and permissions.
   - Ansible installed on your local machine (`ansible --version`).

2. **Deployment**:
   - Clone this repository.
   - Customize variables in `variables.tf` and `main.tf` as needed (e.g., AWS region, key names).
   - Run `terraform init` to initialize Terraform.
   - Run `terraform apply` to create AWS resources based on `main.tf`.

3. **Ansible Practice**:
   - Once Terraform completes provisioning, update `inventory.txt` with actual private IP addresses.
   - Write Ansible playbooks (`*.yml`) to automate tasks on your EC2 instances.
   - Use `ansible-playbook -i inventory.txt playbook.yml` to execute playbooks against your infrastructure.


## Notes

- **Security**: Always handle AWS credentials securely. Use environment variables or other secure methods to pass credentials to Terraform and Ansible.

