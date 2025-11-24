#!/bin/bash

src=$1
size=$(find $src -type f | grep -i '\.heic$' | wc -l)
cnt=0

# we set 'IFS', to support whitespaces in filenames in 'for-in' loop
IFS=$'\n'

# Enable recursive globbing (**)
shopt -s globstar nullglob

for i in **/*.HEIC **/*.heic; do
	((cnt=cnt+1))
	target=$(echo $i | sed 's/heic$/jpg/i')

	if [ "$1" = "--ignore-existing" ] || [ "$2" = "--ignore-existing" ]
	then
		if [ -f "$target" ]
		then
			printf "$target exist, skipped\n"
			continue
		fi
	fi

	printf "$i convert to $target\n"
	/usr/local/bin/magick -quiet $i $target
	printf " [$cnt/$size]\r"
done

# keep same imagemagick version here and in Dockerfile file
printf "\n=== Finished (imagemagick:7.1.1-47) ===\n"
