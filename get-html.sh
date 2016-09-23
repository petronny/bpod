#!/bin/sh
[ ! -d html ] && mkdir html
this_year=`date +'%Y'`
this_month=`date +'%m'|sed 's/^0//'`
download_html(){
	echo $1-$2
	[ -f html/$1-$2.html ] && return
	wget -q -O html/$1-$2.html "http://www.istartedsomething.com/bingimages/?m=$2&y=$1#none"
	sleep 10
}
for year in `seq 2009 $this_year`
do
	if [ $year -eq $this_year ]
	then
		for month in `seq $this_month`
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

wget -q -O html/$this_year-$this_month.html "http://www.istartedsomething.com/bingimages/?m=$2&y=$1#none"
