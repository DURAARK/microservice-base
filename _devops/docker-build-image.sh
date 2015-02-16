#!/bin/sh

SERVICEFILE=./service-info.txt

NAMESPACE=$(sed '1q;d' $SERVICEFILE)
IMAGENAME=$NAMESPACE/$(sed '2q;d' $SERVICEFILE)
DOCKERFILE=$(sed '3q;d' $SERVICEFILE)

echo "Building docker image '$IMAGENAME' from Dockerfile located at '$DOCKERFILE':"
echo "docker build -t $IMAGENAME $DOCKERFILE"

docker build -t $IMAGENAME $DOCKERFILE
