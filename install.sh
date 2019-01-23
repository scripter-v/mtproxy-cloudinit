#!/usr/bin/env sh

export DEBIAN_FRONTEND=noninteractive
export UCF_FORCE_CONFFNEW=1
socks5_user=
socks5_passwd=
mt_proxy_secret=

apt-get -y remove docker docker-engine docker.io
apt-get -y update
apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" dist-upgrade

apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get -y install docker-ce docker-compose

ufw allow OpenSSH
ufw --force enable

wget -O /usr/local/bin/ufw-docker \
  https://github.com/chaifeng/ufw-docker/raw/master/ufw-docker
chmod +x /usr/local/bin/ufw-docker
ufw-docker install

docker run --name socks5 --restart=unless-stopped -p 2081:1080 -e"PROXY_USER=$socks5_user" -e"PROXY_PASSWORD=$socks5_passwd" -d serjs/go-socks5-proxy:latest
docker run --name mtg    --restart=unless-stopped -p 3128:3128 -d nineseconds/mtg:stable $mt_proxy_secret

ufw-docker allow socks5 1080/tcp
ufw-docker allow mtg 3128/tcp
