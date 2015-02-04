#!/bin/sh

NAMESPACE="local"
IMAGENAME=$NAMESPACE/$(cat ./service-info.txt)

# TODO: make following variables configurable from the commandline!
FOLDER=/tmp
COMMAND=$1

if [ -z "$1" ]
  then
    COMMAND="/bin/bash"
    echo "Usage  ./docker-run COMMAND\n"
    echo "No COMMAND provided, defaulting to '/bin/bash'\n"
fi

docker run --rm -it -P -v $FOLDER:/storage --entrypoint="$COMMAND" $IMAGENAME
