#!/bin/bash
ps -u dmesg | wc -l > out1
ps -u dmesg -o pid,cmd --no-headers >> out1
