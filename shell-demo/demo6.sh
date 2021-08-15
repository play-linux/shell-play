#!/bin/bash

#---if----

if [[ 1 -eq 1 ]]; then
    echo "1==1"
fi

if [ "1" -eq "1" ]; then
    echo "1=1"
fi

if [ 1 -ne 2 ]; then
    echo "1!=2"
fi

if ! [ 1 -eq 2 ]; then
    echo "1!=2"
fi

n1=1
n2=1
if [ "$n1" = "$n2" ] && [ "$n1" != "2" ]; then
    echo "n1==1 && n1!=2"
fi

if [ "$n1" -ne "1" ] || [ "$n2" -eq "1" ]; then
    echo "n1!=1 || n2=2"
fi

#查成绩等级
read -r score
if [ "$score" -lt 60 ]; then
    echo "$score"":不及格"
elif [ "$score" -lt 80 ]; then
    echo "$score"":及格"
elif [ "$score" -lt 90 ]; then
    echo "$score"":良好"
else
    echo "$score"":优秀!"
fi
