# Dockerfile
FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye

# Install Python dependencies and Ansible Galaxy roles in a single RUN command
COPY requirements.txt /tmp/
RUN pip install --upgrade pip setuptools && \
    pip install -r /tmp/requirements.txt && \
    rm -rf /tmp/requirements.txt

# Set up additional features and clean up in a single RUN command
RUN apt-get update && \
    apt-get install -y docker.io && \
    rm -rf /var/lib/apt/lists/*