#!/bin/bash

n=1
top=10
dir=/home/duncan/.backgrounds


cd $dir
mv active.jpg 11.jpg
mv 1.jpg active.jpg
while [ $n -lt $((top+1)) ]; do
	mv $(($n+1)).jpg $n.jpg
	let n+=1
done
