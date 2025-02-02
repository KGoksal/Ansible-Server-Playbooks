# Terraform and Ansible Project for Infrastructure and Configuration Management
## Overview 

This project provides Terraform configurations to create AWS EC2 instances for Ansible practice and sample Ansible playbooks to perform common tasks on these instances.

### Terraform Files 
- **main.tf**: Creates EC2 instances with Amazon Linux 2023 and Ubuntu 22.04, along with a security group allowing SSH (22) and HTTP (80) connections.
- **variables.tf**: Defines variables for instance tags, key name, user, AMIs, instance type, and AWS credentials.
- **inventory.txt**: Specifies the Ansible inventory with groups and variables.
- **ansible.cfg**: Configuration file for Ansible settings.

### Ansible Playbooks 
- **install_docker.yml**: Installs and configures Docker on servers.
- **setup_web_server.yml**: Sets up a web server using Apache.
- **create_user.yml**: Creates a user on servers.
- **install_nginx.yml**: Installs and configures Nginx.
- **install_mysql.yml**: Installs and configures MySQL.
- **install_python.yml**: Installs Python and pip on servers.

## Prerequisites
- Terraform installed
- AWS CLI configured with appropriate credentials
- Ansible installed
- SSH key pair created and added to the AWS account

# Usage
## Step 1: Terraform Setup

1. **Initialize Terraform**

   ```
   terraform init 
   terraform apply
   ```

## Step 2: Ansible Setup 
### Update Inventory File 
Ensure the inventory.txt file contains the correct private IP addresses of the created EC2 instances.

### Update Ansible Configuration
Make sure ansible.cfg is correctly configured.

**Step 3: Running Ansible Playbooks**
**Connectivity Test**
```
ansible-playbook connectivity-test-playbook.yaml
```

**Install Docker**
```
ansible-playbook install_docker.yaml
```

**Copy File**

```
ansible-playbook copyfile-playbook.yaml
```

**Create a User**

```
ansible-playbook create_user.yaml
```

**Install and Configure Nginx**

```
ansible-playbook install_nginx.yaml
```

**Install and Configure MySQL**

```
ansible-playbook install_mysql.yaml
```

**Install Python and pip**

```
ansible-playbook install_python.yml
```

************************************************************************************************


# Ansible Ad hoc Commands
## A. Install a package using apt/yum
### a. For CentOS/RHEL:
```
ansible all -b -m yum -a "name=<package_name> state=present"
```
### b. For CentOS/RHEL:
```
ansible all -b -m apt -a "name=<package_name> state=present"
```
## B. Other Commands:
- **Ping all hosts**
```
ansible all -m ping
```
- **Check free memory on all hosts**
```
ansible all -a "free -m"
```
- **Check uptime on all hosts**
```
ansible all -a "uptime"
```
- **Restart a service**
```
ansible <host_group> -b -m service -a "name=<service_name> state=restarted"
```
- **Run a shell command on all hosts**
```
ansible all -a "ls -l /path/to/directory"
```
- **Gather facts from all hosts**
```
ansible all -m setup
```
- **Create a new user on all hosts**
```
ansible all -b -m user -a "name=<username> password=<password> state=present"
```
- **Check disk space on all hosts** 
```
ansible all -a "df -h" 
```
**Notes:** The -b flag is used to become a superuser (equivalent to using sudo). 
- **List all hosts** 
``` 
ansible --list-hosts all  
``` 
- **List all hosts other than web-servers**
```
ansible --list-hosts \!web-servers
```
