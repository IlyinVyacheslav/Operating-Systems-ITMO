#!/bin/bash

> report.log
array=()
cnt=0
while true; do
	array+=( 1 2 3 4 5 6 7 8 9 10 )
	((cnt++))
	if (( $cnt % 100000 == 0 )); then
		echo ${#array[@]} >> report.log
	fi
done
