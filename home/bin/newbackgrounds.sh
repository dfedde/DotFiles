#!/bin/bash
dn=10
n=$2
dir=/home/duncan/.backgrounds

cd $dir

while [ $n -lt $((dn+1)) ]; do
	wget $1$n.jpg
	let n+=1
done 
