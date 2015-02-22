# microservice-base

This is the documentation for 'microservice-base' source. Most likely you are reading this because you are using the [generator-duraark](https://github.com/duraark/generator-duraark) scaffolding tool. If not I recommend to check out the project before returning to this page. [generator-duraark](https://github.com/duraark/generator-duraark) allows you to scaffold microservices development and deploy environments via a CLI tool.

The microservice-base gives you a sane starting point for developing [NodeJS](http://www.nodejs.org) based microservices with SailsJS.

The repository includes:
  * [SailsJS](http://sailsjs.org) for API-layer
  * Mocha test suite integration for SailsJS (based on http://stackoverflow.com/questions/21798840/how-use-mocha-test-framework-with-node-js-and-sails-js)
  * Full Docker support for deployment (see the '_devops_' folder)
  * Setup for local testing with and production with [PM2](https://github.com/Unitech/pm2) and [nodemon](http://nodemon.io/).

## Installation

1. Checkout this repository and delete the '.git' folder to be able to add the files to your own revision control system.
2. Install SailsJS via 'sudo npm -g install sails'

After that you can add you own API logic via the SailsJS CLI (if you are not familiar with SailsJS have a look at the short [introduction video](http://sailsjs.org/)).

## Local development

For local development [nodemon](http://nodemon.io/) is used as process manager. To start developing locally change into the '_devops' folder and run the script 'serve-dev.sh' there (it is important to change into the _devops directory before, as the scripts are working relativ to this folder!). The SailsJS server is started on port 1337. We are currently not using the more sophisticated PM2 as process manager due to an issue where the service is constantly restarted when using PM2's '--watch' option.

## Docker deployment

The '_devops_' folder also contains helper scripts for deploying your service via [Docker](http://www.docker.com). Two steps are necessary to configure the deployment:

1. Change the name of your service in ./_devops_/service-info.txt to your liking
2. Have a look at the ./Dockerfile. Per default it installs NodeJS and SailsJS and starts the SailsJS server on port 1337.

To deploy the service do the following:

1. Build the docker container via './_devops_/docker-build-image.sh'. The docker image will be available as 'local/your-service-name' afterwards.
2. Start the docker container via './_devops_/docker-start-container.sh $PORT'.

When the container is started successfully the service is available on $PORT. If no $PORT is given as parameter SailsJS's default port 1337 is assumed.

## Debugging the Docker container

The script './_devops_/docker-run-container.sh' starts the built docker container and gives you an interactive shell for debugging. You can also give the script a custom command as parameter. In this case the container will execute this command when the container starts (the default is '/bin/bash').
