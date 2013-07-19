#!/bin/bash

#DEBUG=true
DEBUG=false

SEARCH_KEY=LOCAL_PACKAGE_NAME
SEARCH_NAME=$1
if [[ "$SEARCH_NAME" == "" ]]; then
  echo "Usage : $0 <SEARCH_NAME>"
  echo "    ex) $0 TestDeviceSetup"
  exit 1
fi

find . -name Android.mk | xargs grep "\<$SEARCH_NAME\>" | grep "\<$SEARCH_KEY\>"
if [ $? == 0 ]; then
  ANDROID_MK=`find . -name Android.mk | xargs grep "\<$SEARCH_NAME\>" | grep "\<$SEARCH_KEY\>" | sed "s/Android.mk.*/Android.mk/"`
  vim +/"\(\<$SEARCH_KEY\>.*\<$SEARCH_NAME\>\|BUILD_PACKAGE\)" $ANDROID_MK
fi

exit 1
