#!/bin/bash
echo 'Running installation script'
sudo apt update
sudo apt-get install -y git
sudo apt-get install -y nodejs
echo 'Finished running installation script'
# cd ~
# rm test.txt
# touch test.txt
# echo 'Demo file test' > test.txt
# echo 'Cloning repo'
# git clone https://github.com/devslopes-learn/simple-express-server.git
# cd simple-express-server
# nohup node server.js &
# echo 'Started server'
apt install apache2 -y
systemctl start apache2
systemctl enable apache2