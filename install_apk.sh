#!/bin/bash

REALPATH=`realpath $0`
echo $REALPATH
TARGET_DIR=`dirname $REALPATH`
echo $TARGET_DIR
CURRENT_DIR=`pwd`
echo $CURRENT_DIR

APK=$1

pushd /home/khlee/work/source/treepia/treepia/treepia-android/
./scripts/uninstall_pkg.sh
popd

adb install -r -t $CURRENT_DIR/$APK
