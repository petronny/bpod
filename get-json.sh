#!/bin/sh
[ ! -d json ] && mkdir json
[ -z "$1" ] && input=0 || input=$1
wget -O tmp.json "http://www.bing.com/HPImageArchive.aspx?format=js&idx=$input&n=1"
date=`jq '.images[].startdate' tmp.json|sed 's/"//g'`
[ ! -f json/$date.json ] && mv tmp.json json/$date.json
rm -f tmp.json
echo $date
