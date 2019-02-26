#!/bin/sh

MAC=`ifconfig eth0 | grep HWaddr | cut -d ' ' -f 11`
HOST=`cat /etc/hostname`
TEMP=`cputemp |cut -d ' ' -f 1`
LA1=`cat /proc/loadavg | awk '{print $1}'`
LA5=`cat /proc/loadavg | awk '{print $2}'`
LA15=`cat /proc/loadavg | awk '{print $3}'`
FREE=`cat /proc/meminfo | grep MemFree | awk '{ print $2 }'`

curl -i -XPOST 'http://45.77.32.210:8086/write?db=tv' --data-binary "cpu_temp,host=$HOST,mac=$MAC temp=$TEMP,a1=$LA1,a5=$LA5,a15=$LA15,free=$FREE"
