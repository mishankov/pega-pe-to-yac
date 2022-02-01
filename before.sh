uname -a
sudo dnf update -y
sudo sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Linux-*
sudo sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Linux-*
sudo dnf -y install wget tar nano
wget https://gist.githubusercontent.com/cronfy/00e23e126d4fbf3fab37392e414f0e4c/raw/a6c7c8f4ea2462483dc7159dbf42c2ebdaa072e9/dl-cloud-mail-ru.sh
chmod +x dl-cloud-mail-ru.sh
exit
