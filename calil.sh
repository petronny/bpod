#!/bin/sh
cd `dirname $0`
date=`sh get-json.sh`
sh get-image.sh json/$date.json
git add .
git commit -m "[$(LANG=C date)]auto update"
git push
