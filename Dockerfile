FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    openssh-server curl git wget nano \
    nodejs npm python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash mamun && \
    echo 'mamun:password123' | chpasswd && \
    mkdir /var/run/sshd

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

RUN npm install -g @anthropic-ai/claude-code

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

WORKDIR /home/mamun

EXPOSE 22 3000 8080
CMD ["/usr/sbin/sshd", "-D"]
