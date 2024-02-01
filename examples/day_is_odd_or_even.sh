#!/bin/bash
#
# Podmínka zda je den lichý nebo sudý
#
###############################################################################

# only if day is even
day=$(date +%d)
if [ $((10#${day}%2)) -eq 0 ];then
     echo 'date is even - backup now'
else
    echo 'date is odd - no backup'
fi
