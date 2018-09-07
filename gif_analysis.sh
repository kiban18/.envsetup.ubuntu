#!/bin/bash

GIF_NAME=$1
OPTION=$2
if [[ "$GIF_NAME" == "" ]]; then
  echo "Usage : $0 <GIF_NAME> -v"
  echo "    ex) $0 ./sample.gif"
  exit 1
fi

if [[ "$OPTION" == "-v" ]]; then
    echo "ffprobe  ------------------------------------------------------------------------------------------"
    ffprobe -hide_banner $GIF_NAME
    echo "exiftool ------------------------------------------------------------------------------------------"
    exiftool $GIF_NAME
else
    echo "ffprobe  ------------------------------------------------------------------------------------------"
    ffprobe -hide_banner $GIF_NAME | grep "Stream"
    echo "exiftool ------------------------------------------------------------------------------------------"
    exiftool $GIF_NAME | grep "File Name"
    exiftool $GIF_NAME | grep "File Size"
    exiftool $GIF_NAME | grep "MIME Type"
    exiftool $GIF_NAME | grep "GIF Version"
    exiftool $GIF_NAME | grep "Image Size"
    exiftool $GIF_NAME | grep "Color Resolution Depth"
    exiftool $GIF_NAME | grep "Bits Per Pixel"
    exiftool $GIF_NAME | grep "Animation Iterations"
    exiftool $GIF_NAME | grep "Frame Count"
    exiftool $GIF_NAME | grep "Duration"
fi
