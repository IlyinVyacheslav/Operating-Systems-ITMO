#!/bin/bash

file_name="$1"
line_count=$(wc -l < "$file_name")
current_line=0

while IFS= read -r number && (( current_line < line_count )); do
    ((current_line++))
    echo $((number * 2)) >> "$file_name"
done < "$file_name"
