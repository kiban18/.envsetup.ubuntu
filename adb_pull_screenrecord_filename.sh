#!/bin/bash

FILENAME=$1
DATE=`date +%Y%m%d_%H%M%S`
if [[ "$FILENAME" == "" ]]; then
    OUTPUT_FILENAME="crazyup_${DATE}.mp4"
else
    OUTPUT_FILENAME="${FILENAME}_${DATE}.mp4"
fi

echo "${OUTPUT_FILENAME}"

adb pull /sdcard/crazyup.mp4 ${OUTPUT_FILENAME}
