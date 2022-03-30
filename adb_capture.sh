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

TIME=`date +%Y%m%d_%H%M%S`
DEVICE_TEMP="/sdcard/crazyup.png"
LOCAL_OUTPUT="capture_${TIME}.png"

adb $DEVICE_OPTION shell screencap -p ${DEVICE_TEMP}
adb $DEVICE_OPTION pull ${DEVICE_TEMP} ${LOCAL_OUTPUT}
adb $DEVICE_OPTION shell rm ${DEVICE_TEMP}
echo "Image captured to ${LOCAL_OUTPUT}"

#eog ${LOCAL_OUTPUT} &
