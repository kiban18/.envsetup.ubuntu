#!/bin/bash

DEEPLINK=$1
DEVICE=$2
if [[ "${DEEPLINK}" == "" ]]; then
    echo "Usage : `basename $0` <your-deep-link>"
    exit 1
fi

adb shell am start -d ${DEEPLINK}
