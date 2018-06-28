#!/bin/bash

# Update OS with necessary development libs
sudo yum -y update
sudo yum -y install epel-release
sudo yum -y group install "Development Tools"
sudo yum -y install python-devel
sudo yum -y install wget
sudo yum -y install git
sudo yum -y install java-1.8.0-openjdk-devel

# Install Gradle
wget https://services.gradle.org/distributions/gradle-4.8-bin.zip
mkdir /opt/gradle
unzip -d /opt/gradle gradle-4.8-bin.zip
rm gradle-4.8-bin.zip

# Install Maven
mkdir /opt/maven
sudo tar -xzvf /home/vagrant/apache-maven-3.5.4-bin.tar.gz -C /opt/maven
rm -f /home/vagrant/apache-maven-3.5.4-bin.tar.gz

# Install Postgres 9.6
sudo yum -y install https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-6-x86_64/pgdg-centos96-9.6-3.noarch.rpm
sudo yum -y install postgresql96
sudo yum -y install postgresql96-server
service postgresql-9.6 initdb
chkconfig postgresql-9.6 on

# Move files to target directories inside the VM
mkdir /home/vagrant/.m2

echo "export PATH=$PATH:/opt/gradle/gradle-4.8/bin:/opt/maven/apache-maven-3.5.4/bin" >> /home/vagrant/.bashrc