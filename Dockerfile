FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    openssh-server curl git wget nano \
    python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

RUN useradd -m -s /bin/bash mamun && \
    echo 'mamun:password123' | chpasswd && \
    mkdir -p /var/run/sshd

RUN npm install -g @anthropic-ai/claude-code

WORKDIR /home/mamun

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
