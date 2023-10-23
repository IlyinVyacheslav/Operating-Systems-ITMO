#!/bin/bash
end()
{
	killall tail
	kill $(cat .pid)
	exit
}

MODE="add"
RES=1
(tail -f pipe) |
while true; do
	read LINE
	if [[ "$LINE" == "+" ]]; then
		MODE="add"
	elif [[ "$LINE" == "*" ]]; then
		MODE="mul"
	elif [[ "$LINE" == "QUIT" ]]; then
		echo "Stopped by command"
		'end'
	elif [[ "$LINE" =~ ^[-]?[0-9]+ ]]; then
		echo "NUMBER: $LINE"
		case "$MODE" in
		"add")
			RES=$((RES+LINE))
			echo "$RES"
			;;
		"mul")
			RES=$((RES*LINE))
			echo "$RES"
			;;
		*)
			echo "Andrey chmo"
			;;
		esac
	elif [ -n "$LINE" ]; then
		echo "Not supported symbols eror: $LINE"
		'end'
	fi
done

