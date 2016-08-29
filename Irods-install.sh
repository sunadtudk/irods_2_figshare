##  Install from a .gz file ( ftp://ftp.renci.org/pub/irods/releases/4.1.9/  )
yum -y install gcc-c++ make python-devel rpm-build help2man unixODBC fuse-devel curl-devel
yum -y install --enablerepo=centosplus openssl-devel pam-devel bzip2-devel zlib-devel pam-devel openssl-devel libxml2-devel perl-JSON rsync unixODBC-devel epel-release net-tools wget nano mc mlocate ImageMagick python-devel rpm-build help2man bzip2-devel libxml2-devel unixODBC pam-devel openssl-devel wget nano mc tomcat tomcat-webappsl tomcat-admin-webapps tomcat-docs-webapp tomcat-javadoc net-tools postgresql postgresql-serverl postgresql-contrib postgresql-libs postgresql-odbc fuse-libs.x86_64 perl-JSON* python-requests.noarch python-jsonschema python-psutil lsof authd postgresql postgresql-libs postgresql-plperl postgresql-plpython postgresql-server python-jsonschema python-psutil python-requests postgresql-odbc

yum -y groupinstall "Development Tools"
yum -y install python-pip git gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel
##############
git clone https://github.com/DICE-UNC/irods-cloud-browser.git
git clone https://github.com/sunadtudk/irods_2_figshare.git
##############
pip install git+git://github.com/iPlantCollaborativeOpenSource/pycommands.git
pip install --upgrade pip
pip install --upgrade git+git://github.com/irods/python-irodsclient.git
pip install pigshare
#pip install --upgrade pigshare
###############################
#############Build iRODS server###############
wget ftp://ftp.renci.org/pub/irods/releases/4.1.9/irods-4.1.9.tar.gz
tar -zxvf irods-4.1.9.tar.gz
cd irods-4.1.9/packaging/
./build.sh icat postgres
./build.sh -r -v resource
./build.sh icommands
###############Install###############
cd ~/irods-4.1.9/build/
rpm -ivh irods-icat-4.1.9-64bit-centos7.rpm
rpm -ivh irods-database-plugin-postgres-1.9-centos7.rpm
rpm -ivh irods-dev-4.1.9-64bit-centos7.rpm
rpm -ivh irods-runtime-4.1.9-64bit-centos7.rpm
#rpm -ivh irods-database-plugin-postgres93-1.9-centos7.rpm
#rpm -ivh irods-resource-4.1.9-64bit-centos7.rpm
postgresql-setup initdb
systemctl start postgresql
systemctl enable postgresql
######config iRODS server#######
sudo /var/lib/irods/packaging/setup_irods.sh
# rpm -ivh irods-icommands-4.1.9-64bit-centos7.rpm

