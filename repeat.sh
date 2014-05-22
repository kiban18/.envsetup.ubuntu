#!/bin/bash

if [ $# -eq 0 ]
then
    echo "error"
    exit 1
fi

INTERVAL=$1
shift
COMMANDS=$*

echo INTERVAL:$INTERVAL
echo COMMANDS:\"$COMMANDS\"

RESULT=0
while [ $RESULT -eq 0 ]
do
    $COMMANDS
    RESULT=$?
    echo ""
    sleep $INTERVAL
done
