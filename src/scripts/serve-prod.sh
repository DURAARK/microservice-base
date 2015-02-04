#!/bin/sh

# TODO: read all necessary data from file!

SERVICENAME=$(cat ./service-info.txt)
INDEXFILE="app.js"
FOLDER="../"

(cd $FOLDER; pm2 delete $SERVICENAME; pm2 start $INDEXFILE -x --name $SERVICENAME -- --prod)
