![image](image.png)
---
# AWS Static Website Deployment Project

## Overview

This project deploys a static HTML web application on AWS, leveraging various resources for high availability, fault tolerance, and scalability. The deployment utilizes Amazon EC2 instances, a Virtual Private Cloud (VPC) with public and private subnets across two availability zones, security groups, an Internet Gateway, and other AWS services.
---
## Architecture

### VPC Configuration

The project sets up a VPC with public and private subnets in two availability zones for high availability and fault tolerance. An Internet Gateway facilitates communication between instances in the VPC and the Internet.

### Security Groups

Security groups act as firewalls, controlling inbound and outbound traffic. Proper configurations are in place to ensure the security of resources.

### Availability Zones

To enhance availability and fault tolerance, the deployment spans two availability zones. Key resources like Nat Gateway, Bastion Host, and Application Load Balancer use public subnets.

### EC2 Instances

EC2 instances host the static website and are distributed across availability zones using an Auto Scaling Group. The EC2 Instance Connect Endpoint simplifies resource connection.

### Nat Gateway

The Nat Gateway allows instances in private subnets to access the Internet, ensuring resources in private subnets can fulfill their functionalities.

### Auto Scaling Group

An Auto Scaling Group dynamically creates EC2 instances, making the website highly available, scalable, fault-tolerant, and elastic.

### Route 53

Route 53 is used to register the domain name and create a record set, providing DNS resolution for the website.

### GitHub Integration

GitHub is utilized to store the web files, allowing for efficient version control and collaborative development.
---
## Deployment Script

The deployment script automates the installation of the web app on an EC2 instance. Key steps include:

1. Updating the system and installing necessary packages.
2. Downloading the web app files from the GitHub repository.
3. Extracting and copying the files to the appropriate web server directory.
4. Enabling and starting the HTTP server.

### Deployment Script (Bash)

```bash
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
```

## Conclusion

This project successfully deploys a static website on AWS, utilizing various services and resources to achieve a robust and scalable architecture.

---
