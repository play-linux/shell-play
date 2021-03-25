#!/bin/bash


#检测端口是否有通讯

port=${1:-80}
port_count=$(ss -ant | grep -c $port)
if [ ${port_count} -gt 0 ];then
	echo "[${port}] is running!"
else
	echo "[${port}] is shutdown!"
fi


#检测进程是否存在

ps_name="nginx"
ps_count=$(ps -ef | grep $ps_name | grep -cv grep)
echo $ps_count $ps_name
if [ ${ps_count} -gt 0 ];then
	echo "[${ps_name}] is running!"
else
	echo "[${ps_name}] is shutdown!"
fi

