#!/bin/bash
function get_bytes_number {
	echo $(sudo cat /proc/$1/io | grep "read_bytes" | awk '{print $2}')
}

tmp_file="$HOME/lab2/tmp7"
diff_file="$HOME/lab2/diff7"
out_file="$HOME/lab2/out7"
> $tmp_file
> $diff_file
> $out_file
cd /proc
for pid in $(ps -e -o pid); do
	if [ -d $pid ]; then
		echo "$pid $( get_bytes_number $pid )" >> $tmp_file
	fi
done
sleep 60
while IFS= read -r line; do
	pid=$(echo $line | awk '{print $1}')
	if [ -d $pid ]; then
		init_bytes=$(echo $line | awk '{print $2}')
		curr_bytes=$( get_bytes_number $pid )
		diff=$(($curr_bytes - $init_bytes))
		echo "$pid $diff" >> $diff_file
	fi
done < $tmp_file

while read -r line; do
	pid=$(echo $line | awk '{print $1}')
	bytes=$(echo $line | awk '{print $2}')
	command=$(ps -o cmd= $pid)
	echo "$pid:$command:$bytes" >> $out_file
done <<< $(cat $diff_file | sort -r -k 2 -n | head -n 3)

rm -f $tmp_file
rm -f $diff_file

cat $out_file
