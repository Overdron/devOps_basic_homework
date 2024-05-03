#!/bin/bash

sudo -s
apt update
apt install mc -y
cat ~/devOps_basic_homework/init/win_id_rsa.pub >> ~/.ssh/authrisedkeys
apt install maven -y
apt install default-jdk -y
apt install docker.io -y
