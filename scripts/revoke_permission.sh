#!/bin/bash

REALPATH=`realpath $0`
echo $REALPATH
TARGET_DIR=`dirname ${REALPATH}`
echo $TARGET_DIR
source ${TARGET_DIR}/project.sh.include
if [[ $? != 0 ]]; then
    echo "NG: No project.sh.include file"
    exit 1
fi

PERMISSION_NAME=$1
if [[ "$PERMISSION_NAME" == "" ]]; then
  echo "Usage : $0 <PERMISSION_NAME>"
  echo "You can use one of the existing tags below..."
  echo ""
  adb shell pm list permissions -d -g
  adb shell dumpsys package ${PACKAGE_NAME} | grep permission
  exit 1
fi

echo "PACKAGE_NAME: $PACKAGE_NAME"
echo "PERMISSION_NAME: $PERMISSION_NAME"
adb shell pm revoke ${PACKAGE_NAME} ${PERMISSION_NAME}
echo "$?"

exit 0
