#!/bin/bash

head -c 102400 /dev/urandom | od -An -td4 -w4 > "$1"

