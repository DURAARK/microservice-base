#!/bin/sh

# TODO: use proper config file!
SERVICEFILE=./service-info.txt

NAMESPACE=$(sed '2q;d' $SERVICEFILE)
IMAGENAME=$NAMESPACE/$(sed '4q;d' $SERVICEFILE)
DOCKERFILE=$(sed '6q;d' $SERVICEFILE)

echo "Building docker image '$IMAGENAME' from Dockerfile located at '$DOCKERFILE':"
echo "docker build -t $IMAGENAME $DOCKERFILE"

docker build -t $IMAGENAME $DOCKERFILE
