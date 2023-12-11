#!/bin/bash

backgroundProcess="background.sh"
firstProcessPid=$(pgrep -o -f $backgroundProcess)
cpulimit -p $firstProcessPid -l 10 &
