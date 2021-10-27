uname -a
sudo dnf update -y
sudo dnf module list postgresql
sudo dnf -y module enable postgresql:13
sudo dnf -y install postgresql-server
sudo postgresql-setup --initdb
sudo systemctl enable postgresql
sudo systemctl start postgresql
sudo -i -u postgres
createdb pegape86
exit
exit
