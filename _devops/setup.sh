#!/bin/sh

SERVICEFILE=./service-info.txt

SRC=$(sed '5q;d' $SERVICEFILE)

echo "Setting up project:"
echo "  * installing dependencies: (cd $SRC && npm install && bower install)"
(cd $SRC && npm install && bower install)
