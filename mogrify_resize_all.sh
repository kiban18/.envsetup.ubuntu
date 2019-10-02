#!/bin/bash

OUTPUT_DIR="../mogrify_resized"
RESIZE=$1
if [[ "${RESIZE}" == "" ]]; then
    RESIZE="50%"
fi

mkdir -p ${OUTPUT_DIR}

mogrify -resize ${RESIZE} -format png * -path ${OUTPUT_DIR}
