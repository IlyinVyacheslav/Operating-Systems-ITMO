#!/bin/bash
file="$HOME/lab2/tmp4"
> $file
cd /proc
for pid in [0-9]*; do
	if [[ -d $pid ]]; then
		ppid=$(grep -E "PPid" /proc/$pid/status | awk '{print $2}')
		sum_exec_runtime=$(grep -E "se.sum_exec_runtime" /proc/$pid/sched | awk '{print $3}')
		nr_switches=$(grep "^nr_switches" /proc/$pid/sched | awk '{print $3}')
		ART=$(echo "scale=2; $sum_exec_runtime / $nr_switches" | bc)
                echo "ProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$ART" >> $file

	fi
done
cat $file | sort -t '=' -k 3 -n > $HOME/lab2/out4 
