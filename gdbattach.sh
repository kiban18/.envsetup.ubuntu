#!/bin/bash

DEBUG=true
#DEBUG=false

DEBUG_PACKAGE=$1
DEBUG_PORT=$2

if [[ -z "$DEBUG_PACKAGE" || -z "$DEBUG_PORT" ]]; then
    echo "Usage : gdbattach <DEBUG_PACKAGE> <DEBUG_PORT>"
    echo "    ex) gdbattach com.google.tv.mediadevicesapp 10000"
    exit 1
fi

#if [[ -z "$ADBHOST" ]]; then
#    echo "ADBHOST is not defined. exiting..."
#    exit 2
#fi
#
#adbcon.sh # adb connect if disconnected!!

#DEBUG_PID=`adb -s $ADBHOSTPORT shell ps | grep $DEBUG_PACKAGE | awk '{print $2}'`
DEBUG_PID=`adb shell ps | grep $DEBUG_PACKAGE | awk '{print $2}'`
if [[ "$DEBUG" == "true" ]]; then
    echo ""
    echo "DEBUG_PID:$DEBUG_PID for $DEBUG_PACKAGE"
fi

#echo "adb -s $ADBHOSTPORT forward tcp:$DEBUG_PORT tcp:$DEBUG_PORT"
#adb -s $ADBHOSTPORT forward tcp:$DEBUG_PORT tcp:$DEBUG_PORT
echo "adb forward tcp:$DEBUG_PORT tcp:$DEBUG_PORT"
adb forward tcp:$DEBUG_PORT tcp:$DEBUG_PORT

#echo "adb -s $ADBHOSTPORT shell gdbserver :$DEBUG_PORT --attach $DEBUG_PID"
#echo ""
#adb -s $ADBHOSTPORT shell gdbserver :$DEBUG_PORT --attach $DEBUG_PID
echo "adb shell gdbserver :$DEBUG_PORT --attach $DEBUG_PID"
echo ""
adb shell gdbserver :$DEBUG_PORT --attach $DEBUG_PID

exit 0
