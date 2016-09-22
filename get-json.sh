#!/bin/sh
[ ! -d json ] && mkdir json

for i in `seq 0 19`
do
	echo $i
	wget -O json/$i.json "http://www.bing.com/HPImageArchive.aspx?format=js&idx=$i&n=1"
	date=`jq '.images[].startdate' json/$i.json|sed 's/"//g'`
	mv json/$i.json json/$date.json
	sleep 1
done
#http://www.bing.com/HPImageArchive.aspx?format=js&idx=19&n=100
