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

DATE=`date +%Y%m%d_%H%M%S`
OUTPUT_FILENAME="crazyup_${DATE}.mp4"

echo "${OUTPUT_FILENAME}"

adb $DEVICE_OPTION pull /sdcard/crazyup.mp4 ${OUTPUT_FILENAME}
