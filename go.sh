#!/bin/bash
(apt update -y;apt install wget  curl unzip -y)||(yum install wget curl epel-release -y)
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config  
curl https://get.docker.com|bash
usermod -aG docker root;systemctl enable docker
curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
mkdir -p /etc/docker/;wget https://cdn.jsdelivr.net/gh/Subeting/docker-onekey-install/daemon.json -O  /etc/docker/daemon.json
systemctl daemon-reload
systemctl restart docker
echo "/etc/docker/daemon.json"
