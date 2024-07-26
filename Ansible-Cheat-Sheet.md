# Ansible Cheat Sheet

This document provides a comprehensive list of useful Ansible commands and their explanations. Use this cheat sheet to enhance your Ansible workflow and troubleshoot common issues.

## General Commands
### Display Module Documentation

```bash
ansible-doc ping
```
Displays the documentation for the "ping" Ansible module.

### Display Ansible Help

```bash
ansible --help
```
Provides help information for the Ansible command, listing available subcommands and options.

```bash
ansible-playbook --help
```
Provides help information for the `ansible-playbook` command, listing available options and their descriptions.

## Listing Hosts
### List All Hosts

```bash
ansible --list-host all
```
Lists all hosts in the inventory.

### List Hosts in a Specific Group

```bash
ansible --list-host dev
```
Lists all hosts in the "dev" group.

```bash
ansible --list-host webservers
```
Lists all hosts in the "webservers" group.

### List Hosts NOT in a Specific Group

```bash
ansible --list-host \!webservers
```
Lists all hosts that are NOT in the "webservers" group.

### List Hosts in Multiple Groups

```bash
ansible --list-host webserver:devservers
```
Lists all hosts that are in either the "webserver" or "devservers" group.

## Running Playbooks

### Check Mode (Dry Run)

```bash
ansible-playbook playbook.yml --check
```
Runs the playbook in check mode to show what changes would be made without actually making any changes.

```bash
ansible-playbook playbook.yml --check --diff
```
Runs the playbook in check mode and also shows the differences that would be applied.

### Debugging

```bash
ansible-playbook playbook.yml -vvv
```
Runs the playbook with very verbose output for debugging purposes.

### Limit Execution to Specific Hosts

```bash
ansible-playbook playbook.yml -l node1
```
Limits the execution of the playbook to the "node1" host only.

### List Hosts in Playbook

```bash
ansible-playbook playbook.yml --list-hosts
```
Lists all hosts that would be targeted by the playbook.

### List Tasks in Playbook

```bash
ansible-playbook playbook.yml --list-tasks
```
Lists all tasks that would be executed by the playbook.

## Inventory Management

### List Inventory

```bash
ansible-inventory --list
```
Lists all hosts and groups in the inventory.

### Display Inventory Graph

```bash
ansible-inventory --graph
```
Displays a graph of the inventory showing groups and their member hosts.

### List Inventory Plugins

```bash
ansible-doc -t inventory -l
```
Lists all available inventory plugins.

### AWS EC2 Plugin Documentation

```bash
ansible-doc -t inventory aws_ec2
```
Displays the documentation for the `aws_ec2` inventory plugin.

### List Dynamic Inventory in YAML Format

```bash
ansible-inventory -i inventory_aws_ec2.yml --list --yaml
```
Lists the dynamic inventory defined in `inventory_aws_ec2.yml` in YAML format.

## Gathering Facts

### Gather Facts from All Hosts

```bash
ansible all -m setup
```
Gathers facts from all hosts in the inventory.

### Gather Facts with a Specific Module

```bash
ansible all -m gather_facts
```
Gathers facts from all hosts using the `gather_facts` module.

### Filter Gathered Facts

```bash
ansible node3 -m setup | grep ansible_distribution_version
```
Gathers facts from "node3" and filters the output for the `ansible_distribution_version` fact.

```bash
ansible node1:node2 -m setup | grep ansible_os_family
```
Gathers facts from "node1" and "node2" and filters the output for the `ansible_os_family` fact.

### Display Facts from All Hosts and Store Them

```bash
ansible all -m setup --tree /tmp/facts
```
Displays facts from all hosts and stores them indexed by hostname at `/tmp/facts`.

## Ansible Configuration Settings

### Dump Configuration Settings

```bash
ansible-config dump
```
Dumps the current Ansible configuration settings.

### Dump Specific Configuration Settings

```bash
ansible-config dump | grep ROLE
```
Dumps the current Ansible configuration settings and filters for `ROLE`.

### List Specific Configuration Settings

```bash
ansible-config list | grep -E 'HOST_KEY|true'
```
Lists the Ansible configuration settings and filters for `HOST_KEY` or `true`.

### View the Ansible Configuration File

```bash
ansible-config view
```
Displays the contents of your `ansible.cfg` file.

## Running Multiple Playbooks in One Playbook

### Playbooks.yml

```yaml
- import_playbook: ping.yml
- import_playbook: shell.yml
- import_playbook: configure.yml
```
This example shows how to import and run multiple playbooks in a single playbook file.

```
