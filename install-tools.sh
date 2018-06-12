#!/bin/bash

# Update OS with necessary development libs
sudo yum -y update
sudo yum -y group install "Development Tools"
sudo yum -y install python-devel
sudo yum -y install wget
sudo yum -y install java-1.8.0-openjdk-devel
sudo yum -y install maven

# Install PIP
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py

# Install Gradle
wget https://services.gradle.org/distributions/gradle-4.8-bin.zip
mkdir /opt/gradle
unzip -d /opt/gradle gradle-4.8-bin.zip
rm gradle-4.7-bin.zip

# Upgrade pip
pip install --upgrade pip

# Install pipenv
pip install pipenv

# Move files to target directories inside the VM
mkdir /home/vagrant/.m2
cp /vagrant/files/settings.xml /home/vagrant/.m2/settings.xml

echo "export PATH=$PATH:/opt/gradle/gradle-4.8/bin" >> /home/vagrant/.bashrc