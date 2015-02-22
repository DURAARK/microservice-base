#!/bin/sh

# TODO: use proper config file!
SERVICEFILE=./service-info.txt

SERVICENAME=$(sed '2q;d' $SERVICEFILE)
INDEXFILE=$(sed '10q;d' $SERVICEFILE)
APPFOLDER=$(dirname "${INDEXFILE}")

# Using 'pm2' application manager:
pm2 delete $SERVICENAME; pm2 start $INDEXFILE -x --name $SERVICENAME -- --prod
pm2 logs

# Using 'nodemon' for application control:
(cd $APPFOLDER; nodemon -w api -w config)
