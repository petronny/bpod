#!/bin/sh
[ ! -d json ] && mkdir json
wget -O tmp.json "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1"
date=`jq '.images[].startdate' tmp.json|sed 's/"//g'`
mv tmp.json json/$date.json
echo $date
