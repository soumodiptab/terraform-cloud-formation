#!/bin/bash
echo 'Setting up environment for MongoDB'
sudo apt update
sudo apt-get install -y git
cd ~
touch db.txt
echo 'Db setup' > db.txt
echo 'Finished setting up environment for MongoDB' 