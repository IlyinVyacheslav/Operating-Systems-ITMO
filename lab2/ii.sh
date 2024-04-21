#!/bin/bash
ps -au | grep "/sbin/" | awk '{print $2}' > out2
