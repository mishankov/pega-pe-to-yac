sudo dnf -y install java-11-openjdk-headless
sudo dnf -y install wget tar nano

wget http://dlcdn.apache.org/tomcat/tomcat-8/v8.5.72/bin/apache-tomcat-8.5.72.tar.gz
wget https://gist.githubusercontent.com/cronfy/00e23e126d4fbf3fab37392e414f0e4c/raw/a6c7c8f4ea2462483dc7159dbf42c2ebdaa072e9/dl-cloud-mail-ru.sh
chmod +x dl-cloud-mail-ru.sh
./dl-cloud-mail-ru.sh https://cloud.mail.ru/public/XF1o/onAr98fwY postgresql-42.0.0.jar
./dl-cloud-mail-ru.sh https://cloud.mail.ru/public/JyeH/Z9Kznb5pD prhelp.war 
./dl-cloud-mail-ru.sh https://cloud.mail.ru/public/gvvx/v1KdgbnXb prweb.war

sudo mkdir /opt/tomcat
sudo mkdir /opt/pegatemp
sudo tar xvf apache-tomcat-*tar.gz -C /opt/tomcat --strip-components=1
sudo cp -f context.xml /opt/tomcat/conf/context.xml
sudo cp -f postgresql-42.0.0.jar /opt/tomcat/conf/context.xml

echo TODO copy WAR-s here!!!!

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

exit
