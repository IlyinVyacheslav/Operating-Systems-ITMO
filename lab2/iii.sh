#!/bin/bash
ps -au | tail -n 1 | awk '{print $2}'
