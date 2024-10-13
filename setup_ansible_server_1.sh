sudo apt update && sudo apt upgrade –y
sudo apt install ansible -y

ansible-galaxy collection install kubernetes.core
ansible-galaxy collection install community.kubernetes

sudo apt install python3-pip
pip install kubernetes

mkdir -pv $HOME/ansible/playbook $HOME/ansible/inventory
