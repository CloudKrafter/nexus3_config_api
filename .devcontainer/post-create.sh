#!/bin/bash

# Get python version
python_version=$(python --version | cut -d " " -f 2)

# set python_version variable system-wide
echo "export python_version=$python_version" >> /etc/profile

# Create and activate a Python virtual environment
echo "Creating Python virtual environment for Python $python_version"
python3 -m venv .venv-$python_version
source .venv-$python_version/bin/activate

# Ensure we're using the latest version of pip
pip install --upgrade pip setuptools

# Install Python dependencies
pip install -r requirements.txt

# Install Ansible Galaxy roles and collections
ansible-galaxy install -r ansible-requirements.yml
