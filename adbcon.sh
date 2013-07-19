#!/bin/bash

#DEBUG=true
DEBUG=false

ADBHOST=192.168.10.42
ADBHOSTPORT=$ADBHOST:5555

echo "ADBHOSTPORT:$ADBHOSTPORT"
CONNECTED=`adb devices | grep $ADBHOSTPORT`
if [[ "$DEBUG" == "true" ]]; then
    echo "CONNECTED:$CONNECTED"
fi

if [ -z "$CONNECTED" ]; then
    if [[ "$DEBUG" == "true" ]]; then
        echo "adb connect $ADBHOST !!"
    fi
    adb connect $ADBHOST
    RESULT=$?
    if [[ "$DEBUG" == "true" ]]; then
        echo "RESULT : $RESULT"
    fi
else
    echo "already connected to $ADBHOSTPORT ;)"
fi

exit $RESULT
