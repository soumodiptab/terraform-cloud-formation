#!/bin/bash
echo 'Setting up environment for Bastion Host'
sudo apt update
sudo apt-get install -y git
cd ~
touch bastion.txt
echo 'Bastion setup' > bastion.txt
echo 'Finished setting up environment for MongoDB' 