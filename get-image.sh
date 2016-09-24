#!/bin/sh
[ ! -d image ] && mkdir image
download(){
	date=`jq '.images[].startdate' $1|sed 's/"//g'`
	url=`jq '.images[].url' $1|sed 's/"//g'`
	mkdir image/$date
	wget -P image/$date -c $url
	url=`echo $url|sed 's/1920x1080/540x900/'`
	wget -P image/$date -c $url
}
[ -n "$1" ] && download $1 && exit
for i in json/*.json
do
	download $i
done
