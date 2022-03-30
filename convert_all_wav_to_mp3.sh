#!/bin/bash

EXT_ASIS=".wav"
#EXT_ASIS=".WAV"
EXT_TOBE=".mp3"

files=(
    `ls *$EXT_ASIS`
)
for file in "${files[@]}"
do
    echo "asis: $file"
    echo "tobe: ${file/$EXT_ASIS/$EXT_TOBE}"
    ffmpeg -i $file -vn -ar 44100 -ac 9 -b:a 192k "${file/$EXT_ASIS/$EXT_TOBE}"
done
