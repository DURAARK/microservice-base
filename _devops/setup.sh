#!/bin/sh

# TODO: use proper config file!
SERVICEFILE=./service-info.txt

INDEXFILE=$(sed '10q;d' $SERVICEFILE)
APPFOLDER=$(dirname "${INDEXFILE}")

echo "\nSetting up project:"
echo "\n * installing dependencies: (cd $APPFOLDER && npm install && bower install)\n"
(cd $APPFOLDER && npm install && bower install)
