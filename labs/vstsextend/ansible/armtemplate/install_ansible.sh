#!/bin/bash

## Update and upgrade the packages
sudo apt update && sudo apt dist-upgrade -y

## Install pre-requisite packages
sudo apt install -y python3-pip

# Install Ansible.
pip3 install ansible

# Install Ansible az collection for interacting with Azure.
ansible-galaxy collection install azure.azcollection

# Get required modules for Ansible on Azure list
wget https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt

# Install Ansible modules for Azure
sudo pip3 install -r requirements-azure.txt

## Create a credentials file to store azure credentials
sudo mkdir /home/AnsibleVMAdmin/.azure
sudo cat > /home/AnsibleVMAdmin/.azure/credentials EOF <<
[default]
subscription_id=2c8cb0b6-be4a-41ea-9904-5917a35f0cd5
client_id=8790493b-2fdd-4482-bb59-25002a15fb1b
secret=ALXm47Z005KG8SOMmkeCfbxq~KsNlgbniI
tenant=c8cd0425-e7b7-4f3d-9215-7e5fa3f439e8
EOF

##Generating Key Pair
ssh-keygen -t rsa -N ""
cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
