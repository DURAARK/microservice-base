#!/bin/sh

NAMESPACE="local"
IMAGENAME=$NAMESPACE/$(cat ./service-info.txt)

docker build -t $IMAGENAME ../
