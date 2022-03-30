#!/bin/bash

REALPATH=`realpath $0`
echo $REALPATH
TARGET_DIR=`dirname $REALPATH`
echo $TARGET_DIR
CURRENT_DIR=`pwd`
echo $CURRENT_DIR

BUNDLE=$1

pushd /home/khlee/work/source/treepia/treepia/treepia-android/
./scripts/uninstall_pkg.sh
popd

rm -rf $CURRENT_DIR/result.apks

java -jar /home/khlee/work/tool/bundletool-all-1.8.2.jar build-apks \
    --bundle=$BUNDLE \
    --output=$CURRENT_DIR/result.apks \
    --ks="/home/khlee/work/source/treepia/treepia/production/treepia.keystore.jks" \
    --ks-pass=pass:xmflvldk!@# \
    --ks-key-alias=treepia \
    --key-pass=pass:xmflvldk!@# \
    --mode=universal

java -jar /home/khlee/work/tool/bundletool-all-1.8.2.jar install-apks --apks=$CURRENT_DIR/result.apks
