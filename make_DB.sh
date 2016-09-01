############Please chance PASSWORD!!!!!#####################
sudo -u postgres psql -c "CREATE USER irods WITH PASSWORD 'testpassword';"
sudo -u postgres psql -c "CREATE DATABASE "ICAT";"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE "ICAT" TO irods;"
