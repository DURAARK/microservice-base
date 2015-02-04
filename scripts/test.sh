#!/bin/sh
npm install -g sails
(cd ../src && npm -d install && npm test)
