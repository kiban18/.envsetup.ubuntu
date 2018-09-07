#!/bin/bash

REALPATH=`realpath $0`
echo $REALPATH
TARGET_DIR=`dirname ${REALPATH}`
echo $TARGET_DIR
source ${TARGET_DIR}/project.sh.include

vim "$VERSION_FILE" +/"$VERSION_KEYWORD\|$BUILDNO_KEYWORD"

exit 0
