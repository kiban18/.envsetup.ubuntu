#!/bin/bash

if [ $# -eq 0 ]
then
    echo "error"
    exit 1
fi

INTERVAL=$1

RESULT=0
while true
do
    git pull
    RESULT=$?
    if [ "$RESULT" == "0" ]
    then
        zenity --progress --text="found new update"
    fi
done
