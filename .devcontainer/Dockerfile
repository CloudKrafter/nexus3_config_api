# Dockerfile
FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye

# Install Python dependencies and Ansible Galaxy roles in a single RUN command
COPY requirements.txt ansible-requirements.yml /tmp/
RUN pip install --upgrade pip setuptools && \
    pip install -r /tmp/requirements.txt && \
    ansible-galaxy install -r /tmp/ansible-requirements.yml && \
    rm -rf /tmp/requirements.txt /tmp/ansible-requirements.yml

# Set up additional features and clean up in a single RUN command
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*