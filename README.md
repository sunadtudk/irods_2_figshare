# irods_2_figshare
This is a PoC of copying files from iRODS to FigShare via PigShare

I use a CentOS 7...  with a iRODS 4.1.8

Build from my bash script https://github.com/sunadtudk/irods_2_figshare/blob/master/Irods-install.sh

The Test :
Start with : 
nano /home/giraf/.pigshare.conf

the file :

[default]

url = https://api.figshare.com/v2

token = aff111111111111111111111111111111111111111111111111111436043762311191deadbeef1deadbeef1deadbeef1deadbeef1deadbeef1deadbeef

[giraf@irods.dtu.dk ~]$ pigshare create_article --article '{"title": "irods test", "custom_fields": {"key1": "from_irods"}}'

{

  "location": "https://api.figshare.com/v2/account/articles/3393111"

}

[giraf@irods.dtu.dk ~]$ pigshare upload_new_file --id 3393111 figshare_test.txt

Expecting value: line 1 column 1 (char 0)
