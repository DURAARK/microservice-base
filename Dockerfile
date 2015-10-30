FROM ubuntu:14.04

MAINTAINER Martin Hecher <martin.hecher@fraunhofer.at>

RUN DEBIAN_FRONTEND=noninteractive

RUN apt-get clean && apt-get update && apt-get install -qqy curl
## Those are only necessary for the 'duraark-geometricenrichment' service. Maybe they are moved directly into the service later on:
RUN apt-get -y install git software-properties-common build-essential cmake vim libboost-program-options1.55-dev libeigen3-dev apt-transport-https ca-certificates curl iptables

##
## Docker & docker-compose
##
RUN curl -sSL https://get.docker.com/ubuntu/ | sh
RUN curl -L https://github.com/docker/compose/releases/download/1.4.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

##
# NodeJS 0.12
##
RUN curl -sL https://deb.nodesource.com/setup_0.12 | sudo bash -
RUN apt-get install -y nodejs
RUN npm install -g sails gulp-cli nodemon bower grunt-cli
