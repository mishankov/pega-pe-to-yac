sudo dnf -y install java-11-openjdk-headless
sudo dnf -y install wget tar nano

wget http://dlcdn.apache.org/tomcat/tomcat-8/v8.5.72/bin/apache-tomcat-8.5.72.tar.gz

sudo mkdir /opt/tomcat
sudo mkdir /opt/pegatemp
sudo tar xvf apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1

sudo groupadd tomcat
sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat

sudo chgrp -R tomcat /opt/tomcat
sudo chown -R tomcat /opt/tomcat
sudo chgrp -R tomcat /opt/pegatemp
sudo chown -R tomcat /opt/pegatemp

sudo cp tomcat.service /etc/systemd/system/tomcat.service

sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat
sudo systemctl status tomcat

exit