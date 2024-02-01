#!/bin/bash
#
# Podmínka zda je týden lichý nebo sudý
#
###############################################################################

# only if week is even
week=`date +"%V"`
if [ $(($week%2)) -eq 0 ];then
     echo 'week is even - backup now'
else
    echo 'week is odd - no backup'
fi
