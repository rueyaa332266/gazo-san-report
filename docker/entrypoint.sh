#!/bin/bash

node capture_script.js
# make env.js
bash env.sh > /var/www/html/env.js

cd /var/www/html/
gazosan compare.png base.png output --create-change-image
service nginx start
tail -f /dev/null