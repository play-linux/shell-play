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




