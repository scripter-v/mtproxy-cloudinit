#!/usr/bin/env sh

export DEBIAN_FRONTEND=noninteractive
export UCF_FORCE_CONFFNEW=1

sudo apt-get -y remove docker docker-engine docker.io
sudo apt-get -y update
sudo apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" dist-upgrade

sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get -y install docker-ce docker-compose

ufw allow OpenSSH
ufw allow https
ufw --force enable

sudo wget -O /usr/local/bin/ufw-docker \
  https://github.com/chaifeng/ufw-docker/raw/master/ufw-docker
chmod +x /usr/local/bin/ufw-docker
ufw-docker install

git clone https://github.com/scripter-v/mtproxy.git /root/work/mtproxy
git clone https://github.com/scripter-v/tinysocks5.git /root/work/tinysocks5
cd /root/work/tinysocks5/ && docker-compose up -d
ufw-docker allow socks5 1080/tcp
