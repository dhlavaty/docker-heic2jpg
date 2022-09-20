#!/bin/sh

src=$1
size=$(find $src -type f | grep -i '\.heic$' | wc -l)
cnt=0

# we set 'IFS', to support whitespaces in filenames in 'for-in' loop
IFS=$'\n'

for i in $(find $src -type f | grep -i '\.heic$')
do
	((cnt=cnt+1))
	target=$(echo $i | sed 's/heic$/jpg/i')
	printf "$i convert to $target\n"
	/usr/bin/convert $i $target
	printf " [$cnt/$size]\r"
done

printf "\n=== Finished ===\n"
