#!/bin/sh
echo "Updating apt and upgrading installed packages"
sudo apt update -y
sudo apt upgrade -y

echo "Installing basic packages"
sudo apt install bash bat ca-certificates curl delta diffutils fd-find findutils fzf gh git git-lfs jq kdiff3 nodejs npm python3-dev python3-pip python3-setuptools

echo "Installing yq"
wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 -O /usr/bin/yq &&\
    chmod +x /usr/bin/yq

echo "Installing and configuring cheat"
cd /tmp \
  && wget https://github.com/cheat/cheat/releases/download/4.4.2/cheat-linux-amd64.gz \
  && gunzip cheat-linux-amd64.gz \
  && chmod +x cheat-linux-amd64 \
  && sudo mv cheat-linux-amd64 /usr/local/bin/cheat
rsync -a ../cheat ~/.config/cheat

echo "Installing fuck"
pip3 install thefuck --user

echo "Installing pyenv"
curl https://pyenv.run | bash

echo "Installing kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo "Configuring git"
cp ../gitconfig ~/.gitconfig
