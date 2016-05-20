# please note!  
# please do before playing with figshare: 
# yum update ; yum -y install python-pip
# pip install git+git://github.com/iPlantCollaborativeOpenSource/pycommands.git
# pip install --upgrade pip
# pip install --upgrade git+git://github.com/irods/python-irodsclient.git
# pip install pigshare
#  Do a "pigshare -h"  to see the API ;-)
# irods_2_figshare
# By Sune Andersen
# version 0.1b   
import fileinput
import requests
import os
from irods import *
from irods.session import iRODSSession
from irods.models import Collection, User, DataObject

sess = iRODSSession(host='localhost', port=1247, user='irodsuser', password='XxxxxxxA', zone='MyZone')
coll = sess.collections.get("/MyZone/home/irodsuser")

fileout = open('figshare_test.txt', 'w')

objf = sess.data_objects.get("/MyZone/home/irodsuser/figshare_test.txt")
with objf.open('r+') as f:
   for line in f:
     fileout.write(line)
#   Test : 
#BASH #   pigshare create_article --article '{"title": "irods test", "custom_fields": {"key1": "from_irods"}}'
#{
# "location": "https://api.figshare.com/v2/account/articles/3393214"    <----  This number is the article ID for upload
#}
#BASH #    pigshare upload_new_file --id 3393214 figshare_test.txt
