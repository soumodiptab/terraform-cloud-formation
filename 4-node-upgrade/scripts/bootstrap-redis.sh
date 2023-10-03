#!/bin/bash
yum update -y
yum install htop -y
sudo amazon-linux-extras install epel -y
sudo yum update
sudo yum install redis-server
sudo yum install redis
sudo sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis.conf
sudo redis-server /etc/redis.conf
