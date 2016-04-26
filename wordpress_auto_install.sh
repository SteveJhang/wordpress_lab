#!/bin/bash

#read -p "Please input db password: " dbpass 

sudo yum install httpd mariadb-server php php-mysql wget -y
wget https://tw.wordpress.org/latest-zh_TW.tar.gz
tar -zxf latest-zh_TW.tar.gz
sudo chown apache: wordpress/ -R
sudo mv wordpress/wp-config-sample.php wordpress/wp-config.php
sudo mv wordpress/ /var/www/html/
sudo systemctl enable mariadb httpd
sudo systemctl start mariadb
mysqladmin -u root password 'mysql'
mysql -e "create database wordpress;" -u root -pmysql
sudo setsebool -P httpd_read_user_content 1
sudo systemctl start httpd
