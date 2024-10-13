#!/bin/bash

# Variables
KEY_NAME="id_rsa"  # Name of the SSH key file
KEY_DIR="$HOME/.ssh"  # Directory to store the SSH key
COMMENT="your_email@example.com"  # Comment for the SSH key

# Create the .ssh directory if it does not exist
mkdir -p $KEY_DIR

# Generate the SSH key
ssh-keygen -t rsa -b 4096 -C "$COMMENT" -f "$KEY_DIR/$KEY_NAME" -N ""

# Print the location of the generated keys
echo "SSH key pair generated:"
echo "Private Key: $KEY_DIR/$KEY_NAME"
echo "Public Key: $KEY_DIR/${KEY_NAME}.pub"

#ssh-copy-id
ssh-copy-id hoanganh@192.168.1.11
ssh-copy-id hoanganh@192.168.1.12

#add ip to inventory
# Define the inventory file path
INVENTORY_FILE="$HOME/ansible/inventory/kube_inventory"


# Create the necessary directory structure if it doesn't exist
mkdir -p $(dirname $INVENTORY_FILE) && echo "" > $INVENTORY_FILE

# Write the inventory content to the file
cat <<EOF > $INVENTORY_FILE
[master]
master ansible_host=192.168.1.10 ansible_port=22 ansible_user=root

[workers]
worker1 ansible_host=192.168.1.11 ansible_port=22 ansible_user=root
worker2 ansible_host=192.168.1.12 ansible_port=22 ansible_user=root
EOF

# Print a message indicating the file has been written
echo "Inventory file created at $INVENTORY_FILE"
