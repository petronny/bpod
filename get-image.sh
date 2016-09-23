#!/bin/sh
[ ! -d image ] && mkdir image
for i in json/*.json
do
	date=`jq '.images[].startdate' $i|sed 's/"//g'`
	url=`jq '.images[].url' $i|sed 's/"//g'`
	mkdir image/$date
	wget -P image/$date -c $url
	url=`echo $url|sed 's/1920x1080/540x900/'`
	wget -P image/$date -c $url
done
