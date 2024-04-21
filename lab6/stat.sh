#!/bin/bash

script="./seq_run.sh"
for N in {1..20}; do
total=0
for i in {1..10}; do
for (( j = 0; j < $N; j++ )); do
        bash "./make_file.sh" "text${j}.txt"
done
time_str=$( { time bash $script $N; } 2>&1 | grep real | awk '{print $2}')
real_time=$(echo $time_str | awk '{split($1,a,"m"); split(a[2],s,"s"); print (a[1]*60) + s[1]}')
total=$(echo "$total + $real_time" | bc)
done
echo "$total"
done
