#!/bin/bash
max_mem=0
max_mem_pid=0
cd /proc
for pid in [0-9]*; do
	if [ -d $pid ]; then
		curr_mem=$(grep "VmRSS" /proc/$pid/status | awk '{print $2}')
		if [ -n "$curr_mem" ] && [ "$curr_mem" -gt "$max_mem" ]; then
			max_mem="$curr_mem"
			max_mem_pid="$pid"
		fi
	fi
done
echo $max_mem_pid
