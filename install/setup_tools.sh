#!/bin/sh
echo "Updating apt and upgrading installed packages"
sudo apt update -y
sudo apt upgrade -y

echo "Installing basic packages"
sudo apt install bash bat ca-certificates curl delta diffutils fd-find findutils fzf gh git git-delta git-lfs jq kdiff3 nodejs npm python3-dev python3-pip python3-setuptools yq

echo "Installing...other stuff"
pip3 install thefuck --user

echo "Installing pyenv"
curl https://pyenv.run | bash

echo "Installing kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
