#!/bin/bash

apt install mc -y
cat win_id_rsa.pub >> /home/user2/.ssh/authrisedkeys
#apt install maven -y
#apt install default-jdk -y
apt install docker.io -y
apt install docker-compose -y
export CURRENT_DIR=&(pwd)
cd /
git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
cd $CURRENT_DIR

