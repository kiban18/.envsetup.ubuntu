#!/bin/bash

ADBHOST=192.168.10.42
PORT=5555
DEBUG=false

function adbcon() {
    echo "ADBHOST:PORT=$ADBHOST:$PORT"
    CONNECTED=`adb devices | grep $ADBHOST:$PORT`
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
        echo "already connected to $ADBHOST:$PORT ;)"
    fi
    return $RESULT
}

while true; do
    if nc -z -w 4 $ADBHOST $PORT; then
        adbcon
        adb -s $ADBHOST:$PORT logcat mali_winsys:S mali_winsys-cache:S mali_winsys-worker:S
    else
        echo waiting adbd...
        sleep 1;
    fi
done
