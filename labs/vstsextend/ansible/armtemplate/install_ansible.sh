#!/bin/bash

# Update all packages that have available updates.
sudo apt update -y

# Install Python 3 and pip.
sudo apt install -y python3-pip

# Upgrade pip3.
sudo pip3 install --upgrade pip

# Install Ansible.
pip3 install "ansible==2.9.17"

# Install Ansible azure_rm module for interacting with Azure.
pip3 install ansible[azure]

## Create a credentials file to store azure credentials
sudo -u AnsibleVMAdmin mkdir /home/AnsibleVMAdmin/.azure
sudo -u AnsibleVMAdmin cat > /home/AnsibleVMAdmin/.azure/credentials <<EOF
[default]
subscription_id=2c8cb0b6-be4a-41ea-9904-5917a35f0cd5
client_id=8790493b-2fdd-4482-bb59-25002a15fb1b
secret=ALXm47Z005KG8SOMmkeCfbxq~KsNlgbniI
tenant=c8cd0425-e7b7-4f3d-9215-7e5fa3f439e8
EOF

##Generating Key Pair
sudo -u AnsibleVMAdmin ssh-keygen -t rsa -N "" -f /home/AnsibleVMAdmin/.ssh/id_rsa
sudo -u AnsibleVMAdmin cat /home/AnsibleVMAdmin/.ssh/id_rsa.pub > /home/AnsibleVMAdmin/.ssh/authorized_keys
