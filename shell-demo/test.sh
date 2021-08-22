#!/bin/bash

arr=(10 23 6 54 7 6 20)

quick() {
    if [ $1 -ge $2 ]; then
        return 0
    fi
    pivot=$1
    i=$1
    j=$2

    while [ $i -lt $j ];do
        while [ $i -lt $j ] && [ ${arr[$j]} -ge ${arr[$pivot]} ];do
            j=$((j-1))
            echo "j:" $j
        done
        while [ $i -lt $j ] && [ ${arr[$i]} -le ${arr[$pivot]} ];do
            i=$((i+1))
            echo "i:" $i
        done
        if [ $i -lt $j ];then
            t=${arr[$i]}
            ${arr[$i]}=${arr[$j]}
            ${arr[$j]}=t
        fi
    done

    t=${arr[$pivot]}
    ${arr[$pivot]}=${arr[$i]}
    ${arr[$pivot]}=$t
    pivot=$i
    
    quick $1 $((pivot-1)) 
    quick $((pivot+1)) $2
}

quick 0 ${#arr[@]}

echo ${arr[*]}
