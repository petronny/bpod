#!/bin/sh
for i in html/*
do
	sed -n '/resize/p' -i $i
done
