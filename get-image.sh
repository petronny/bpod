#!/bin/sh
download(){
	date=`jq '.images[].startdate' $1|sed 's/"//g'`
	url=`jq '.images[].url' $1|sed -e 's/"//g' -e 's/^\//http:\/\/www.bing.com\//'`
	mkdir -p image/$date
	filename=`echo $url | sed 's/.*\///'`
	[ ! -f image/$date/`echo $filename| sed 's/1920x1080/1920x1200/'` ] && wget -P image/$date -c `echo $url|sed 's/1920x1080/1920x1200/'`
	[ ! -f image/$date/`echo $filename| sed 's/1920x1080/1920x1200/'` ] && wget -P image/$date -c $url
	[ ! -f image/$date/`echo $filename| sed 's/1920x1080/540x900/'` ] && wget -P image/$date -c `echo $url|sed 's/1920x1080/540x900/'`
}
if [ -n "$1" ]
then
	download $1
else
	for i in json/*.json
	do
		download $i
	done
fi
