#!/bin/bash

#-----case------

case $1 in
1)
    echo "one"
    ;;
2)
    echo "two"
    ;;
3)
    echo "three"
    ;;
4)
    echo "four"
    ;;
5)
    echo "five"
    ;;
*)
    echo "other"
    ;;
esac

case $2 in
[a-zA-Z])
    echo "letter"
    ;;
[0-9])
    echo "digit"
    ;;
*)
    echo "other"
    ;;
esac
