FROM ubuntu:14.04

RUN DEBIAN_FRONTEND=noninteractive

# Install NodeJS from PPA
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:chris-lea/node.js -y
RUN apt-get update -y
RUN apt-get -y install nodejs -y
RUN sudo npm install sails nodemon -g

CMD ["bash"]
