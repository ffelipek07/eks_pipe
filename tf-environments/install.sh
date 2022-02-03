#!/bin/bash

# Install base dependencies
sudo apt-get update \
    && sudo apt-get install -y \
        autoconf \
        build-essential \
        ca-certificates \
        pkg-config \
        software-properties-common \
        wget \
        xvfb \
        curl \
        git \
        ant \
        ssh-client \
        unzip \
        iputils-ping \
        zip \
        jq \
        gettext-base \
        tar \
        parallel \
        unzip \
        apt-transport-https \
        gnupg-agent \
    && sudo rm -rf /var/lib/apt/lists/*

# Install AWS cli
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && aws --version

# Install Terraform 0.14.11
wget https://releases.hashicorp.com/terraform/1.1.4/terraform_1.1.4_linux_amd64.zip \
    && unzip terraform_1.1.4_linux_amd64.zip \
    && sudo mv terraform /usr/local/bin/ \
    && sudo rm terraform_1.1.4_linux_amd64.zip \
    && terraform -version

# Install Terragrunt
wget https://github.com/gruntwork-io/terragrunt/releases/download/v0.23.4/terragrunt_linux_amd64 \
    && sudo mv terragrunt_linux_amd64 terragrunt \
    && sudo chmod +x terragrunt \
    && sudo mv terragrunt /usr/local/bin/terragrunt \
    && terragrunt --version

# Install kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" \
    && echo "$(<kubectl.sha256)  kubectl" | sha256sum --check \
    && sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && kubectl version --client