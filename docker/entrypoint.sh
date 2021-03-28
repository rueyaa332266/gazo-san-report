#!/bin/bash

mkdir /report/images
node capture_script.js

mv index.html /report
sed -i 's@BaseURL@'"$BaseURL"'@' /report/index.html
sed -i 's@CompareURL@'"$CompareURL"'@' /report/index.html

cd /report
gazosan ./images/compare.png ./images/base.png ./images/output --create-change-image
service nginx start
tail -f /dev/null