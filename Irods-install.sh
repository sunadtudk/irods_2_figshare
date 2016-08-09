##  Install from a .gz file ( ftp://ftp.renci.org/pub/irods/releases/4.1.9/  )
yum -y install gcc-c++ make python-devel rpm-build help2man unixODBC fuse-devel curl-devel
yum -y install --enablerepo=centosplus openssl-devel pam-devel bzip2-devel zlib-devel pam-devel openssl-devel libxml2-devel perl-JSON
yum -y install rsync unixODBC-devel epel-release net-tools wget nano mc mlocate ImageMagick python-devel rpm-build help2man
yum -y install bzip2-devel libxml2-devel unixODBC pam-devel openssl-devel wget nano mc tomcat tomcat-webappsl tomcat-admin-webapps
yum -y install tomcat-docs-webapp tomcat-javadoc net-tools postgresql postgresql-serverl postgresql-contrib postgresql-libs
yum -y install postgresql-odbc fuse-libs.x86_64 perl-JSON* python-requests.noarch python-jsonschema python-psutil lsof
yum -y install authd postgresql postgresql-libs postgresql-plperl postgresql-plpython postgresql-server python-jsonschema python-psutil python-requests postgresql-odbc

#wget ftp://ftp.renci.org/pub/irods/releases/4.1.9/irods-4.1.9.tar.gz
#tar -zxvf irods-4.1.9.tar.gz
#cd irods-4.1.9/packaging/
#./build.sh  icat postgres
#./build.sh -s resource
#./build.sh -s icommands

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
