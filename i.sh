#!/bin/bash

startDate=$(date +"%F_%H:%M:%S")
mkdir $HOME/test
if [ $? -eq 0 ]; then
	touch $HOME/test/"$startDate"
	echo "catalog test was created successfully" > ~/report
fi

ping www.net_nikogo.ru
if [ $? -ne 0 ]; then
	currentDate=$(date +"%F_%H:%M:%S")
	echo "$currentDate host is not available" >> ~/report
fi
