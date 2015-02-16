#!/bin/sh
npm install -g sails
(cd ../ && npm -d install && npm test)
