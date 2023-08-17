#!/bin/bash
echo 'Setting up environment for MongoDB'
sudo yum update
sudo yum install -y git htop
sudo touch /etc/yum.repos.d/mongodb-org-5.0.repo
sudo cat <<EOF >> /etc/yum.repos.d/mongodb-org-5.0.repo
[mongodb-org-5.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/5.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-5.0.asc
EOF
sudo yum install -y mongodb-org-5.0.19 mongodb-org-database-5.0.19 mongodb-org-server-5.0.19 mongodb-org-shell-5.0.19 mongodb-org-mongos-5.0.19 mongodb-org-tools-5.0.19
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g' /etc/mongod.conf
sudo systemctl enable mongod
sudo systemctl start mongod