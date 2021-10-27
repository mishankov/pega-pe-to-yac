uname -a
sudo dnf update -y
sudo dnf -y install wget tar nano
wget https://gist.githubusercontent.com/cronfy/00e23e126d4fbf3fab37392e414f0e4c/raw/a6c7c8f4ea2462483dc7159dbf42c2ebdaa072e9/dl-cloud-mail-ru.sh
chmod +x dl-cloud-mail-ru.sh
./dl-cloud-mail-ru.sh https://cloud.mail.ru/public/XF1o/onAr98fwY postgresql-42.0.0.jar
./dl-cloud-mail-ru.sh https://cloud.mail.ru/public/JyeH/Z9Kznb5pD prhelp.war 
./dl-cloud-mail-ru.sh https://cloud.mail.ru/public/gvvx/v1KdgbnXb prweb.war
