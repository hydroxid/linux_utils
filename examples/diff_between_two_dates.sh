#!/bin/bash
#
# Podmínka zda rozdíl mezi daty větší než 10 dnů
#
###############################################################################

# only diff is bigger than 10 days
datePast='20240101'
dateNow=$(date '+%y%m%d')
let diff=(`date +%s -d $dateNow`-`date +%s -d $datePast`)/86400
echo $diff
if [ diff > 10 ];then
     echo 'bigger than 10 - backup now'
else
    echo 'less than 10 - no backup'
fi
