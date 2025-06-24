#!/bin/sh
apt-get update
apt-get install -y sudo vim gedit locales gnupg2 wget curl zip lsb-release bash-completion
apt-get install -y net-tools iputils-ping mesa-utils software-properties-common build-essential
apt-get install -y python3 python3-pip
apt-get install -y openssh-server openssl git