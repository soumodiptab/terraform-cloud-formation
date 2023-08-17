#!/bin/bash
sudo yum update -y
sudo yum-config-manager --enable epel -y
sudo yum install erlang --enablerepo=epel -y
sudo yum install -y socat
sudo yum install logrotate
sudo yum install rabbitmq-server -y
sudo rabbitmqctl add_user rabbitmq rabbitmq
sudo systemctl enable rabbitmq-server
sudo service rabbitmq-server start
sudo rabbitmq-plugins enable rabbitmq_management
sudo rabbitmqctl add_user rabbitmq rabbitmq
sudo rabbitmqctl set_user_tags rabbitmq administrator
echo 'loopback_users = none' > /etc/rabbitmq/rabbitmq.conf
