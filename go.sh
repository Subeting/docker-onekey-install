#!/bin/bash
(apt update;apt install wget  curl -y)||(yum install wget curl epel-release -y)
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config  
curl https://get.docker.com|bash
usermod -aG docker root;systemctl enable docker
mkdir -p /etc/docker/;wget https://cdn.jsdelivr.net/gh/Subeting/docker-onekey-install/daemon.json -O  /etc/docker/daemon.json
systemctl daemon-reload
systemctl restart docker
echo "/etc/docker/daemon.json"
