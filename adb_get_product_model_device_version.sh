#!/bin/bash

DEVICE=$1
if [[ "${DEVICE}" == "" ]]; then
    echo "Usage : `basename $0` <DEVICE_ID>"
    echo ""
    adb devices
    exit 1
fi


RO_PRODUCT_MODEL=`adb -s ${DEVICE} shell getprop ro.product.model`
RO_PRODUCT_DEVICE=`adb -s ${DEVICE} shell getprop ro.product.device`
RO_BUILD_VERSION_SDK=`adb -s ${DEVICE} shell getprop ro.build.version.sdk`
RO_BUILD_VERSION_REL=`adb -s ${DEVICE} shell getprop ro.build.version.release`
echo "model:  ${RO_PRODUCT_MODEL}"
echo "device: ${RO_PRODUCT_DEVICE}"
echo "version code: ${RO_BUILD_VERSION_SDK}"
echo "version name: ${RO_BUILD_VERSION_REL}"
