#!/bin/sh
cd `dirname $0`
git reset --hard
git pull
date=`sh get-json.sh`
sh get-image.sh json/$date.json
git add .
git commit -m "[$(LANG=C date)]auto update"
git push
