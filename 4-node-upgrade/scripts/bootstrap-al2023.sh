#!/bin/bash
# Deployment Script for KoreServer
sudo yum update
sudo yum install git htop -y # install dependencies
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
chmod 600 ~/.ssh/id_rsa # fix permission for private key
#install node 18
nvm install 18
nvm use 18
npm install pm2 -g
# configure github for getting code.
git config --global user.name "soumodiptaBo-Kore"
git config --global user.email "soumodipta.bose@kore.com"
ssh-keyscan github.com >> ~/.ssh/known_hosts
cd ~
mkdir kore
cd kore
git clone git@github.com:Koredotcom/KoreServer.git
cd KoreServer
git checkout bots_dev
git pull
sudo adduser nginx
sudo apt-get install nginx -y
sudo mv /etc/nginx /etc/nginx-old
sudo service nginx start
cd /var
sudo mkdir www
sudo ln -s /home/ec2-user/kore/KoreServer/ /var/www
sudo ln -s /home/ec2-user/kore/KoreServer/config/nginx/ /etc
cd /home/ec2-user/kore/KoreServer/config/nginx/
sudo ln -s integrations.conf nginx.conf
sudo service nginx restart
