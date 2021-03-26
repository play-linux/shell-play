#!/bin/bash

#检测主机存活状态

IP_LIST=("www.google.com" "icepan.cloud" "github.com")

function ping1(){
	for ip in ${IP_LIST[*]};do
		count=0
		echo "ping ${ip}....."
		for i in {1..3};do
			if ! ping -c 1 -w 2 ${ip} &>/dev/null;then #-c表示平的次数  -w表示超时时间s
				count=$((count+1))
			fi
		done
		if [ $count -eq 3 ];then
			echo "${ip} is failure!"
		else
			echo "${ip} is successful!"
		fi
	done
}


