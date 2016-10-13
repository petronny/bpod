#!/bin/sh
[ ! -d json ] && mkdir json
[ -n "$1" ] && $1=0
wget -O tmp.json "http://www.bing.com/HPImageArchive.aspx?format=js&idx=$1&n=1"
date=`jq '.images[].startdate' tmp.json|sed 's/"//g'`
mv tmp.json json/$date.json
echo $date
