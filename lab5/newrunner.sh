#!/bin/bash

k=30
N=$1

for (( i = 0; i <= $k; i++ ))
do
	echo "$i"
	./newmem.bash $N &
	sleep 1
done
