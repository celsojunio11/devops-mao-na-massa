#/bin/bash
yum install epel-release -y
yum install wget git -y 
sudo wget --no-check-certificate -O /etc/yum.repos.d/jenkins.repo  https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
yum install java-11-openjdk-devel -y
yum install jenkins -y
systemctl daemon-reload
systemctl start jenkins

###Instalação Docker e Docker Compose
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli container.io -y
sudo systemctl start docker
sudo systemctl enable docker 
#(Instalação do docker compose do tutorial, bugado) sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$ ( uname -s ) -$ ( uname -m )" -o /usr/local/bin/docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.1.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
systemctl restart docker
usermod -a -G docker jenkins