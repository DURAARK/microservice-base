# microservice-base

This is the documentation for 'microservice-base' source. Most likely you are reading this because you are using the [generator-duraark](https://github.com/duraark/generator-duraark) scaffolding tool. If not I recommend to check out the project before returning to this page. [generator-duraark](https://github.com/duraark/generator-duraark) allows you to scaffold microservices development and deploy environments via a CLI tool.

The microservice-base gives you a sane starting point for developing [NodeJS](http://www.nodejs.org) based microservices.

The repository includes:
  * [SailsJS](http://sailsjs.org) for API-logic
  * Mocha test suite integration for SailsJS (based on http://stackoverflow.com/questions/21798840/how-use-mocha-test-framework-with-node-js-and-sails-js)
  * Full Docker support for deployment (see the 'scripts' folder)
  * Setup for local testing with [PM2](https://github.com/Unitech/pm2)

## Installation

1. Checkout this repository and delete the '.git' folder to be able to add the files to your own revision control system.
2. Install SailsJS via 'sudo npm -g install sails'

After that you can add you own API logic via the SailsJS CLI (if you are not familiar with SailsJS have a look at the short [introduction video](http://sailsjs.org/)).

## Local development

For local development [PM2](https://github.com/Unitech/pm2) is used as process manager. To start developing locally start the script './src/scripts/serve-dev.sh'. It starts the SailsJS server on port 1337. The '--watching' option of PM2 is not enabled at the moment, due to an issue where the service is constantly restarted. You can simply exchange PM2 with other process managers, like nodemon, forever, etc. to get automatic restarts on code changes.

## Docker deployment

The 'deployment' folder contains helper scripts for deploying your service via [Docker](http://www.docker.com). Two steps are necessary to configure the deployment:

1. Change the name of your service in ./deployment/service-info.txt to your liking
2. Have a look at the ./Dockerfile. Per default it installs NodeJS and SailsJS and starts the SailsJS server on port 1337.

To deploy the service do the following:

1. Build the docker container via './deployment/docker-build.sh'. The docker image will be available as 'local/your-service-name' afterwards.
2. Start the docker container via './deployment/docker-start-service.sh $PORT'.

When the container is started successfully the service is available on $PORT. If no $PORT is given as parameter it is started on SailsJS's default port 1337.

## Debugging the Docker container

The script './deployment/docker-run.sh' starts the built docker container and gives you an interactive shell for debugging.
