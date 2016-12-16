#!/usr/bin/env bash
echo "# Update apt"
apt-get update -qy
echo "# Install common dev dependencies via apt"
apt-get install -y build-essential \
libpq-dev nodejs npm patch \
openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev vim \
libssl-dev libyaml-dev libpq-dev \
libxml2-dev libxslt-dev libc6-dev \
libssl-dev libxrender-dev gdebi
apt-get clean
