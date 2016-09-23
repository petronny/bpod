#!/bin/sh
for i in html/*
do
	grep 'resize' -B1 $i > $i.tmp
	sed \
		-e '/^--$/d' \
		-e 's/.*href="#\([^"]*\)".*/\1/g' \
		-e 's/.*resize\.php?i=\([^_]*\).*alt=/\1\n/g' \
		-e 's/ \/>$//' -i $i.tmp
	mv $i.tmp $i
done
