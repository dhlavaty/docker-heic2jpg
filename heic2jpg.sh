#!/bin/sh

src=$1
size=$(find $src -type f | grep heic | wc -l)
cnt=0

for i in $(find $src -type f | grep heic)
do
    ((cnt=cnt+1))
	target=$(echo $i | sed 's/heic$/jpg/')
	printf "$i convert to $target\n"
	/usr/bin/convert $i $target
	printf " [$cnt/$size]\r"
done

printf "\n=== Finished ===\n"