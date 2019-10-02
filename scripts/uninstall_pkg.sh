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

echo "PACKAGE_NAME: $PACKAGE_NAME"
adb shell pm uninstall -k --user 0 ${PACKAGE_NAME}
echo "$?"

exit 0
