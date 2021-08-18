#!/bin/bash

#-------------打印相关------------

#1.echo
#echo会自动换行
username='lyer' && echo $username && echo Hi,${username}
echo $username,"\n"
#-e转义
echo -e "Hi",$username"\n"
echo "--------------------"


#2.printf <format> args
printf "%s,%s\n" hello $username
printf "I'm %s,%d years old\n" $username 18


#3.引号转义
s1="$username" #能解析变量的值
s2='$username' #原样输出
echo $s1 $s2

