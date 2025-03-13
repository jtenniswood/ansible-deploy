FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    ssh \
    git \
    && rm -rf /var/lib/apt/lists/*

# Install Ansible
RUN pip3 install ansible>=2.9.0

# Install Tailscale
RUN curl -fsSL https://tailscale.com/install.sh | sh

# Set working directory
WORKDIR /github/workspace

# Ensure Python and Ansible are in PATH
ENV PATH="/usr/local/bin:${PATH}"
