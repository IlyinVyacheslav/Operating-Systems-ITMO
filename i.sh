#!/bin/bash

startDate=$(date +"%F_%H:%M:%S")
mkdir $HOME/test && touch $HOME/test/"$startDate" && echo "catalog test was created successfully" > ~/report
ping www.net_nikogo.ru || currentDate=$(date +"%F_%H:%M:%S") && echo "$currentDate host is not available" >> ~/report
