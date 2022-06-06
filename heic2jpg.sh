#!/bin/sh

src=$1
size=$(find $src -type f | grep -i '\.heic$' | wc -l)
iter=0

for fn in $(find $src -type f | grep -i '\.heic$')
do
	iter=$((iter+1))
	target=$(echo $fn | sed 's/heic$/jpg/i')
	# https://www.tutorialkart.com/bash-shell-scripting/bash-date-format-options-examples/
	FILE_DATE=$(/bin/date +%Y%m%d%H%M.%S -r ${fn})
	printf "$iter/$size:\n"
	printf "  File: $fn\n"
	printf "  Creation date: $FILE_DATE\n"
	printf "  Convert as file: $target\n"
	/usr/bin/convert $fn $target
	# Set the same date as the original image
	/bin/touch -a -m -t $FILE_DATE $target
	printf "\n\r"
done

printf "\n=== Finished ===\n"
