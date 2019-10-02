#!/bin/bash

DEVICE=$1
if [[ "$DEVICE" == "" ]]; then
    DEVICE_OPTION=""
elif [[ "$DEVICE" == "s8" ]]; then
    DEVICE_OPTION="-s ce021712c809770703"
elif [[ "$DEVICE" == "s6" ]]; then
    DEVICE_OPTION="-s 02157df299144830"
else
    DEVICE_OPTION="-s $DEVICE"
fi

adb $DEVICE_OPTION shell screenrecord /sdcard/crazyup.mp4 --verbose
