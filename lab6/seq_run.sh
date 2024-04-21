#!/bin/bash

script="./file_script.sh"
for (( i = 0; i < "$1"; i++ )); do
	bash $script "text${i}.txt"
done
