#!/bin/bash
mem="mem_state.txt"
script="script_state.txt"
script2="script_state2.txt"
> "$mem"
> "$script"
> "$script2"
script_pid=$(pgrep -f mem.bash | tail -n 1)
script_pid2=$(pgrep -f mem2.bash)
echo $script_pid2
echo $script_pid
while true; do
top -b -n 1 | head -n 5 | tail -n 2 >> "$mem"
top -b -n 1 | grep -E "($script_pid|PID)" >> "$script"
top -b -n 1 | grep -E "($script_pid2|PID)" >> "$script2"
sleep 1
if ! ps -p $script_pid > /dev/null && ! ps -p $script_pid2 > /dev/null; then
        echo "Процесс mem.bash был прерван. Завершение работы скрипта."
        exit 1
    fi
done
