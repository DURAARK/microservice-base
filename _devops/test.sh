#!/bin/sh

SERVICEFILE=./service-info.txt

SRC=$(sed '5q;d' $SERVICEFILE)

echo "Starting test suite:"
echo "  * installing global dependencies: npm install -g sails\n\n"
npm install -g sails

echo "\n\n  * installing local dependencies: (cd $SRC && npm -d install)\n\n"
(cd $SRC && npm -d install)

echo "\n\n  * execute tests: (cd $SRC && npm test)"
(cd $SRC && npm test)
