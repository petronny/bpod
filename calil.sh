#!/bin/sh
cd `dirname $0`
git reset --hard
git pull
for i in `seq 0 19`
do
	date=`sh get-json.sh $i`
	sh get-image.sh json/$date.json
done
git add .
git commit -m "[$(LANG=C date)]auto update"
git push
