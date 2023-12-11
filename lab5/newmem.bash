#!/bin/bash

array=()
cnt=0
while true; do
	array+=( 1 2 3 4 5 6 7 8 9 10 )
	((cnt++))
	if [ ${#array[@]} -eq $1 ]; then
		echo "array bounderies achieved"
        	exit 1
	fi
done

