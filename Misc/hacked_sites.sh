#! /bin/bash

# This script requires Shodan commercial API key 

sudo pip install shodan
echo "Enter you API Key"
read api
shodan init $api
echo "Enter the total results you want to get:"
read limitvar
echo $limitvar
shodan download --limit $limitvar hacked 'title:"hacked by"'
shodan parse --fields ip_str,port,org,hostnames hacked.json.gz
echo "#########################################################"
echo "#################Names of Hackers########################"
echo "#########################################################"
shodan parse --fields title hacked.json.gz | grep -i "hacked by" | sed -e 's/.*hacked by//' 
