#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y debconf-utils
export DEBIAN_FRONTEND="noninteractive"

sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password qwerty"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password qwerty"
sudo apt-get install -y mysql-server
sudo service mysql start
mysql -u root -pqwerty -e "create database wordpress; GRANT ALL PRIVILEGES ON wordpress.* TO wordpress@localhost IDENTIFIED BY 'qwerty'"

sudo update-rc.d mysql defaults
