#!/bin/bash

# Signal 2 is Ctrl+C
trap "echo Ctrl+C was pressed; exit 0" 2

DEVICE=device
DEBUG=false


while true; do
    adb devices | grep $DEVICE
    if [[ $? = 0 ]]; then
        adb logcat
    else
        echo waiting adbd...
        sleep 1;
    fi
done
