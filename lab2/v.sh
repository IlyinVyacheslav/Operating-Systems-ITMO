#!/bin/bash
input_file=out4
tmp_file=tmp5
> $tmp_file
prev_ppid=0
n=0
sum=0
while IFS= read -r line; do
	ppid=$(echo $line | awk -F '[=:]' '{print $4}')
	if [ $ppid -eq $prev_ppid ]; then
		n=$((n + 1))
		ART=$(echo $line | awk -F '[=:]' '{print $6}')
		sum=$(echo "scale=2; $sum + $ART" | bc)
	elif [ $n -ne 0 ]; then
		M=$(echo "scale=2; $sum / $n" | bc)
		echo "Average_Running_Children_of_ParentID=$prev_ppid is $M" >> $tmp_file
		n=0
		sum=0
	fi
	prev_ppid=$ppid
	echo $line >> $tmp_file
done < $input_file
mv $tmp_file $input_file
