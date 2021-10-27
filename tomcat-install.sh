sudo dnf -y install java-11-openjdk-headless
sudo dnf -y install wget tar nano

wget http://dlcdn.apache.org/tomcat/tomcat-8/v8.5.72/bin/apache-tomcat-8.5.72.tar.gz

sudo mkdir /opt/tomcat
sudo mkdir /opt/pegatemp

cd /opt/tomcat

sudo groupadd tomcat
sudo useradd -M -s /bin/nologin -g tomcat -d /opt/tomcat tomcat
sudo chgrp -R tomcat /opt/tomcat
sudo chgrp -R tomcat /opt/pegatemp

sudo chmod -R g+r conf
sudo chmod g+x conf
sudo chown -R tomcat webapps/ work/ temp/ logs/ conf/
sudo chown -R tomcat /opt/pegatemp
exit