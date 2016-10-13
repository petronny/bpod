#!/bin/sh
cd `dirname $0`
git reset --hard
git pull
for i in `seq 0 19`
do
<<<<<<< HEAD
	date=`sh get-json.sh`
=======
	date=`sh get-json.sh $i`
>>>>>>> 9b8e2cbe9eb08959a240d6583d0ad2bcc2fd5d1e
	sh get-image.sh json/$date.json
done
git add .
git commit -m "[$(LANG=C date)]auto update"
git push
