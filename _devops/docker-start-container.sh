#!/bin/sh

# TODO: use proper config file!
SERVICEFILE=./service-info.txt

NAMESPACE=$(sed '2q;d' $SERVICEFILE)
IMAGENAME=$NAMESPACE/$(sed '4q;d' $SERVICEFILE)
CONTAINERNAME=$(sed '4q;d' $SERVICEFILE)

DEFAULTPORT=1337
HOSTPORT=$1

if [ -z "$1" ]
  then
    HOSTPORT=$DEFAULTPORT
    echo "Usage  ./docker-run HOSTPORT\n"
    echo "No HOSTPORT provided, assuming default port $DEFAULTPORT\n"
fi

echo "Removing "
docker rm -f $CONTAINERNAME
echo "\n(NOTE: If the above command yields an error don't worry, that's fine. We tried to remove the old container before starting, but there was none started.)"

echo "\nStarted as "
docker run -d -p $HOSTPORT:1337 --name $CONTAINERNAME $IMAGENAME
