#!/bin/sh
npm install -g sailsjs
(cd src && npm -d install && npm test)
