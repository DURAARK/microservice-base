FROM ubuntu:14.04

RUN DEBIAN_FRONTEND=noninteractive

# Install NodeJS from PPA
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:chris-lea/node.js -y
RUN apt-get update -y
RUN apt-get -y install nodejs -y
RUN sudo npm install sails -g

# Bundle app, install, expose and finally run it
COPY ./ /microservice
WORKDIR /microservice
EXPOSE 1337

RUN npm install

ENTRYPOINT ["sails", "lift", "--prod"]
