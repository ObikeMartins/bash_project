#!/bin/bash

#first task

if [ "$#" -eq 2 ] && [ "$1" == "-d" ] && [ -d $2 ]
then 
	echo "Disk usage in our directory"
	sudo du -h --max-depth=1 "$2" | sort -rh | head
fi

#second task

if [ "$#" -eq 2 ] && [ "$1" == "-n" ]
then
	n=8
	mezikko_dir="$2"
	echo "the top $n entries by default according to the disk usage" 
	sudo du -h --max-depth=1 "$mezikko_dir" | sort -rh |head -n "$n"

elif [ "$#" -eq 3 ] && [ "$1" == "-n" ] && [ "$2" -gt 0 ]
then
	n="$2"
	mezikko_dir="$3"
	echo "top $n write disk usage"
	sudo du --max-depth=1 "$mezikko_dir" | sort -rh | head -n "$n"
fi
