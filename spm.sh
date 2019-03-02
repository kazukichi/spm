#!/bin/sh
#
# Simplicity Ping Monitoring.
#  This script outputs the packet loss rate
#  in CSV format.

DATE=$(date +%Y%m%d)
TIME=$(date +%H:%M)
DIR=/var/log/ping
OUT=${DIR}/${DATE}.log

DST=$1

if [ -z $1 ] ; then
echo "./script dst"
exit 1
fi

echo "$DATE,$TIME,$DST,`ping -c60 $DST | grep loss | awk '{print $6 }'`" >> $OUT

