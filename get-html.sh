#!/bin/sh
[ ! -d html ] && mkdir html
download_html(){
	echo $1-$2
	wget -q -O html/$1-$2.html "http://www.istartedsomething.com/bingimages/?m=$2&y=$1#none"
	sleep 10
}

this_year=`date +'%Y'`
for year in `seq 2009 $this_year`
do
	if [ $year -eq $this_year ]
	then
		for month in `seq $(date +'%m')`
		do
			download_html $year $month
		done
	else
		for month in `seq 12`
		do
			download_html $year $month
		done
	fi
done
