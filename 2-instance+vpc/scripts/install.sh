#!/bin/bash
# add installation script for:
# nodejs rabbit-mq mongo redis trino nginx
echo 'Running installation script'
sudo apt update
sudo apt-get install -y git
sudo apt-get install -y nodejs
echo 'Finished running installation script'
cd ~
echo 'Cloning repo'
git clone https://github.com/devslopes-learn/simple-express-server.git
cd simple-express-server
nohup node server.js &
echo 'Started server'