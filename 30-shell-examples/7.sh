#!/bin/bash

#监控CPU 磁盘 内存利用率

#vmstat http://c.biancheng.net/view/1081.html


IP=$(ip addr | awk '/inet /' | awk 'NR==2 {print $2}')
DATE=$(date +%F" "%T)

##CPU
US=$(vmstat | awk 'NR==3 {print $13}')
SY=$(vmstat | awk 'NR==3 {print $14}')
IDLE=$(vmstat | awk 'NR==3 {print $15}')
WAIT=$(vmstat | awk 'NR==3 {print $16}')
USE=$(($US+$SY))

echo "---------------CPU--------------------"
echo "
	Date: $DATE
	Host: $IP
	非内核进程消耗CPU: ${US}%
	内核进程消耗CPU: ${SY}%
	空闲CPU: ${IDLE}%
	等待IO消耗CPU: ${WAIT}
	一共消耗CPU: ${USE}%
	"


##Mem
TOTAL=$(free -m | awk '/Mem/ {print $2}')
USED=$(free -m | awk '/Mem/ {print $3}')
FREE=$(free -m | awk '/Mem/ {print $4}')
echo "--------------------Mem----------------"
echo "	
	total: ${TOTAL}m
	used: ${USED}m
	free: ${FREE}m
"


#disk









