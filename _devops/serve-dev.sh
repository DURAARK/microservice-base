#!/bin/sh

# TODO: use proper config file!
SERVICEFILE=./service-info.txt

SERVICENAME=$(sed '2q;d' $SERVICEFILE)
INDEXFILE=$(sed '10q;d' $SERVICEFILE)
APPFOLDER=$(dirname "${INDEXFILE}")

# FIXXME: pm2 with --watching enabled currently restarts the service permanently.
# We are using nodemon to circumvent this problem but are working on a solution
# to make it work with pm2

# Using 'pm2' as process manager:
#pm2 delete $SERVICENAME; pm2 start $INDEXFILE -x --name $SERVICENAME --watch
#pm2 logs

# Using 'nodemon' as process manager:
(cd $APPFOLDER; nodemon -w api -w config)
