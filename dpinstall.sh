#!/bin/bash
sudo apt-get update
sudo apt-get install -y git vim maven apt-transport-https ca-certificates curl software-properties-common wget snapd

sudo apt-get update
sudo snap install intellij-idea-community --classic

sudo apt-get update
sudo apt install mysql-server
sudo systemctl start mysql.service
sudo mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
exit
sudo mysql_secure_installation

sleep 3

mysql -u root -p
ALTER USER 'root'@'localhost' IDENTIFIED WITH auth_socket;
exit

sudo mysql
CREATE USER 'username'@'host' IDENTIFIED WITH authentication_plugin BY 'password';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, INDEX, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit

sudo apt-get update
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
echo "Checking the status of installed packages"
sudo chkconfig docker on
sudo systemctl enable docker
