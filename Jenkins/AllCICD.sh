#!/bin/bash
sudo apt update
sudo apt install openjdk-17-jdk -y

installJenkins(){
        sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
    https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

    if [ $? -eq 0 ]; then 
        sudo apt-get update
        sudo apt-get install jenkins -y
         echo "Installation of jenkins Done"
    else
        echo "problem in Installation of jenkins"
    fi
}

installMaven(){
    cd /tmp
    wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
    tar -xvf apache-maven-3.9.6-bin.tar.gz
    sudo mv apache-maven-3.9.6 /opt/maven
    if [ $? -eq 0 ]; then 
        echo "Maven Done make sure to set Env path"
        echo "Relogin to maven"
    fi
}

installDocker(){
    curl -fsSL https://get.docker.com -o install-docker.sh
    sh install-docker.sh
    if [ $? -eq 0 ]; then
        sudo chown ubuntu /var/run/docker.sock
    else 
        echo "Problem in docker installation"
    fi
}

installJenkins
installMaven
installDocker