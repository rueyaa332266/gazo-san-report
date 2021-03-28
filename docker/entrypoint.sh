#!/bin/bash

mkdir /report/images
node capture_script.js

mv report.html /report
sed -i 's@BaseURL@'"$BaseURL"'@' /report/report.html
sed -i 's@CompareURL@'"$CompareURL"'@' /report/report.html

cd /report
gazosan ./images/compare.png ./images/base.png ./images/output --create-change-image

if [ $1 = local-server ]; then
    service nginx start
    tail -f /dev/null
fi