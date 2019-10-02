#!/bin/bash

EXT_ASIS=".pdf"
EXT_TOBE=".jpg"

files=(
    `ls *$EXT_ASIS`
)
for file in "${files[@]}"
do
    echo "asis: $file"
    echo "tobe: ${file/$EXT_ASIS/$EXT_TOBE}"
    convert -density 300 $file -quality 90 "${file/$EXT_ASIS/$EXT_TOBE}"
done
