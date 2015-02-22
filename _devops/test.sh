#!/bin/sh

# TODO: use proper config file!
SERVICEFILE=./service-info.txt

INDEXFILE=$(sed '10q;d' $SERVICEFILE)
APPFOLDER=$(dirname "${INDEXFILE}")

echo "\nStarting test suite:"
echo "\n  * installing global dependencies: npm install -g sails (NOTE: Assumes you are root!\n"
npm install -g sails

echo "\n\n  * installing local dependencies: (cd $APPFOLDER && npm -d install)\n\n"
(cd $APPFOLDER && npm -d install)

echo "\n\n  * execute tests: (cd $APPFOLDER && npm test)"
(cd $APPFOLDER && npm test)
