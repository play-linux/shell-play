#!/bin/bash

#参考: https://blog.csdn.net/fdipzone/article/details/24329523


#随机获取8位字符串
function randStr(){
	echo $RANDOM | md5sum | cut -c 1-8
	echo date +%s%N | md5sum | cut -c 1-8
}
randStr




#获取指定范围随机数
function randInt(){
	min=$1
	max=$(($2-$min+1))
	num=$(date +%s%N) #%s时间戳 %N纳秒
	echo $((${num}%${max}+$min))
}
randInt 1 5




