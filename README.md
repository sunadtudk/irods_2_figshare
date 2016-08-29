# irods_2_figshare
ToDo (Ask Markus): 
* Meta + user data from the file need to be sendt to FigShare...  
* Send Mail/note to user about online URL.

This is a PoC of copying files from iRODS to FigShare via PigShare (installed with pip)

yum update ; yum -y install python-pip

pip install git+git://github.com/iPlantCollaborativeOpenSource/pycommands.git

pip install --upgrade pip

pip install --upgrade git+git://github.com/irods/python-irodsclient.git

pip install pigshare

pip install --upgrade pigshare

pigshare is from my NZ-friend :  Markus Binsteiner @ https://github.com/makkus/pigshare  

Clone : https://github.com/makkus/pigshare.git

I use a CentOS 7...  with a iRODS 4.1.x (testing with 4.1.9 and 4.2)

Build from my bash script https://github.com/sunadtudk/irods_2_figshare/blob/master/Irods-install.sh

The Test :
Start with : 
nano /home/giraf/.pigshare.conf

the file :

[default]

url = https://api.figshare.com/v2

token = aff111111111111111111111111111111111111111111111111111436043762311191deadbeef1deadbeef1deadbeef1deadbeef1deadbeef1deadbeef

token is the Personal Tokens found under : https://figshare.com/account/applications 

[giraf@irods.dtu.dk ~]$ pigshare create_article --article '{"title": "irods test", "custom_fields": {"key1": "from_irods"}}'

{

  "location": "https://api.figshare.com/v2/account/articles/3393111"

}

[giraf@irods.dtu.dk ~]$ pigshare upload_new_file --id 3393111 figshare_test.txt

Expecting value: line 1 column 1 (char 0)
