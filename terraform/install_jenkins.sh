#!/bin/bash

# Update packages
dnf update -y

# Install Git
dnf install git -y

# Install Docker
dnf install docker -y

# Start and enable Docker
systemctl enable --now docker

# Install Java 21
dnf install java-21-amazon-corretto -y

# Install Maven
dnf install maven -y

# Add Jenkins repository
wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import Jenkins repository key
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

# Install Jenkins
dnf install jenkins -y

# Add Jenkins user to Docker group
usermod -aG docker jenkins

# Start and enable Jenkins
systemctl enable --now jenkins

# Log installation output
echo "Jenkins installation completed"
