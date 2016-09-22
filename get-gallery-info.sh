#!/bin/sh
[ ! -d json ] && mkdir json

for i in `seq 1 100`
do
	echo $i
	wget -O json/$i.json "http://www.bing.com/gallery/home/imagedetails/$i?z=0"
	cat json/$i.json
	sleep 1
done
