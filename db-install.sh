uname -a
sudo dnf update -y
sudo dnf module list postgresql
sudo dnf -y module enable postgresql:13
sudo dnf -y install postgresql-server
sudo postgresql-setup --initdb
sudo systemctl enable postgresql
sudo systemctl start postgresql

sudo mkdir /opt/dbdump
sudo sh -c 'cat pega.001 pega.002 > /opt/dbdump/pega'
rm pega.001 pega.002
sudo cp pg_hba.conf /opt/dbdump
sudo chown -R postgres:postgres /opt/dbdump
sudo -i -u postgres

createdb pegape86

time pg_restore -U postgres --disable-triggers -O -j 2 -v -d pegape86 /opt/dbdump/pega
time psql -U postgres -d pegape86 -c 'REINDEX DATABASE pegape86;'

psql -U postgres -d pegape86 -c 'create user pega;'
psql -U postgres -d pegape86 -c "alter user pega with password 'pega';"
psql -U postgres -d pegape86 -c 'grant all privileges on database pegape86 to pega;'
psql -U postgres -d pegape86 -c 'ALTER DATABASE pegape86 OWNER TO pega;'

psql -U postgres -d pegape86 -c 'GRANT ALL ON SCHEMA data,rules TO pega;'
psql -U postgres -d pegape86 -c 'GRANT ALL ON ALL TABLES IN SCHEMA data,rules TO pega ;'
psql -U postgres -d pegape86 -c 'GRANT ALL ON ALL SEQUENCES IN SCHEMA data,rules TO pega ;'
psql -U postgres -d pegape86 -c 'GRANT ALL ON ALL FUNCTIONS IN SCHEMA data,rules TO pega ;'

mv /var/lib/pgsql/data/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf_backup
cp /opt/dbdump/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf

exit
sudo systemctl restart postgresql
exit
