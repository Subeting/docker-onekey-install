#!/bin/bash
(apt update;apt install curl -y)||(yum install curl -y)
curl https://get.docker.com|bash
usermod -aG docker root;systemctl enable docker
mkdir -p /etc/docker/;wget https://cdn.jsdelivr.net/gh/Subeting/docker-onekey-install/daemon.json -O  /etc/docker/daemon.json
systemctl daemon-reload
systemctl restart docker
