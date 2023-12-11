#!/bin/bash
echo $$ > .pid
RES=1
MODE=""
usr1()
{
	MODE="add"
}
usr2()
{
	MODE="mul"
}
usr3()
{
	MODE="ostanov"
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'usr3' SIGTERM

while true; do
	case $MODE in
	"add")
		let RES=$RES+2
		echo $RES
		;;
	"mul")
		let RES=$RES*2
		echo $RES
		;;
	"ostanov")
		echo "Stopped by SIGTERM"
		exit
		;;
	esac
	sleep 1
done

