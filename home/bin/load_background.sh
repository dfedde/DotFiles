#!/bin/bash

n=1
top=10
dir=/home/duncan/.backgrounds


cd $dir/extras/$1
rm $dir/*
cp $(ls | while read x; do echo "`expr $RANDOM % 1000`:$x"; done \
	| sort -n| sed 's/[0-9]*://' | head -11) $dir

#rename them numaricly 
cd $dir
for i in *.jpg; do
	new=$(printf "%d.jpg" ${n})
	mv ${i} ${new}
	let n+=1
done 
#make the last one active
mv 11.jpg active.jpg
