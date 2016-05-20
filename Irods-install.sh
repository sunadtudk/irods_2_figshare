
yum -y update; yum -y upgrade; yum -y update;
yum -y install net-tools wget nano mc
##  please note big files need tcp ports : Range (Begin): 20000 (End):20199
firewall-cmd --zone=public --add-port=1248/tcp --permanent
firewall-cmd --zone=public --add-port=1247/tcp --permanent
firewall-cmd --zone=public --add-port=5432/tcp --permanent
firewall-cmd --zone=public --add-service=http --permanent
firewall-cmd --zone=public --add-service=https --permanent
firewall-cmd --reload
##FirewallD  ##

##  Install from a .gz file ( ftp://ftp.renci.org/pub/irods/releases/4.1.8/  )
###### /packaging/build.sh --release --verbose icat postgress ; /packaging/build.sh --release --verbose  
###### resource ;  /packaging/build.sh --release --verbose icommands 
wget ftp://ftp.renci.org/pub/irods/releases/4.1.8/centos7/irods-database-plugin-mysql-1.8-centos7-x86_64.rpm
wget ftp://ftp.renci.org/pub/irods/releases/4.1.8/centos7/irods-database-plugin-postgres-1.8-centos7-x86_64.rpm
wget ftp://ftp.renci.org/pub/irods/releases/4.1.8/centos7/irods-database-plugin-postgres93-1.8-centos7-x86_64.rpm
wget ftp://ftp.renci.org/pub/irods/releases/4.1.8/centos7/irods-dev-4.1.8-centos7-x86_64.rpm
wget ftp://ftp.renci.org/pub/irods/releases/4.1.8/centos7/irods-icat-4.1.8-centos7-x86_64.rpm
wget ftp://ftp.renci.org/pub/irods/releases/4.1.8/centos7/irods-icommands-4.1.8-centos7-x86_64.rpm
wget ftp://ftp.renci.org/pub/irods/releases/4.1.8/centos7/irods-resource-4.1.8-centos7-x86_64.rpm
wget ftp://ftp.renci.org/pub/irods/releases/4.1.8/centos7/irods-runtime-4.1.8-centos7-x86_64.rpm
rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
yum -y install http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm
yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sed -i 's/enabled=0/enabled=1/g' /etc/yum.repos.d/remi.repo
yum -y install http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
yum -y install epel-release  net-tools wget nano mc mlocate ImageMagick python-devel rpm-build help2man bzip2-devel libxml2-devel unixODBC pam-devel openssl-devel wget nano mc tomcat tomcat-webappsl tomcat-admin-webapps tomcat-docs-webapp tomcat-javadoc net-tools postgresql postgresql-serverl postgresql-contrib postgresql-libs postgresql-odbc fuse-libs.x86_64 perl-JSON* python-requests.noarch python-jsonschema python-psutil lsof authd
rpm -ivh irods-dev-4.1.8-centos7-x86_64.rpm
rpm -ivh irods-icat-4.1.8-centos7-x86_64.rpm
rpm -ivh irods-runtime-4.1.8-centos7-x86_64.rpm
rpm -ivh irods-database-plugin-postgres-1.8-centos7-x86_64.rpm
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql
