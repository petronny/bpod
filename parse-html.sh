#!/bin/sh
for i in html/*
do
	grep 'resize' -B1 $i > $i.tmp
	mv $i.tmp $i
done
