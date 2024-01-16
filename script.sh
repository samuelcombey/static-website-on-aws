#!/bin/bash
sudo su
yum update -y
yum install -y httpd
cd /var/www/html
wget https://github.com/samuelcombey/website/raw/main/website.zip
unzip website.zip
cp -r /var/www/html/website-main/* /var/www/html
rm -rf website.zip website-main
systemctl enable httpd
systemctl start httpd