#!/bin/sh
[ ! -d gallery-json ] && mkdir gallery-json
lastest=`ls gallery-json | sort -g -r | head -n1| awk '{print $1}' | sed 's/\.json$//'`
rm gallery-json/$lastest.json
for i in `seq $lastest $(($lastest+1000))`
do
	echo $i
	if [ ! -f gallery-json/$i.json ]
	then
		wget -O gallery-json/$i.json -q "http://www.bing.com/gallery/home/imagedetails/$i?z=0"
		sleep 2
	fi
	[ `du gallery-json/$i.json | awk '{print $1}'` -eq 0 ] && rm gallery-json/$i.json
done
