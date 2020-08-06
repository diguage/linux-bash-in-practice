#!/usr/bin/env bash
#
# init script
#

apt-get update -y -m
apt-get dist-upgrade

echo "install Docker..."
apt-get remove -y docker docker-engine docker.io containerd runc
apt-get update -y -m
apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update -y -m
apt-get dist-upgrade -y
apt-get install docker-ce docker-ce-cli containerd.io git
apt-get autoremove -y
apt-get autoclean -y
docker info
docker run hello-world

echo "open BBR..."
lsmod | grep bbr
echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
sysctl -p
sysctl net.ipv4.tcp_available_congestion_control
lsmod | grep bbr

echo "add user diguage..."
adduser diguage
usermod -aG sudo diguage
usermod -aG docker diguage
echo "diguage ALL=(ALL) NOPASSWD:ALL" | sudo tee -a /etc/sudoers
