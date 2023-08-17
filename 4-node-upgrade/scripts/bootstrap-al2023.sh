#!/bin/bash
sudo yum update
sudo yum install git htop -y # install dependencies
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
chmod 600 ~/.ssh/id_rsa # fix permission for private key
nvm install 18
nvm use 18
# configure github for getting code.
git config --global user.name "soumodiptaBo-Kore"
git config --global user.email "soumodipta.bose@kore.com"
ssh-keyscan github.com >> ~/.ssh/known_hosts
cd ~
mkdir kore
cd kore
git clone git@github.com:Koredotcom/KoreServer.git
cd KoreServer
npm install pm2 -g
