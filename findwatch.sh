#!/bin/bash

WATCH_IMEI_PHONE=$1
OPTION=$2
if [[ "$WATCH_IMEI_PHONE" == "" ]]; then
  echo "Usage : $0 <WATCH_IMEI> -v"
  echo "Usage : $0 <WATCH_PHONENUMBER> -v"
  echo "    ex) $0 0123456789"
  exit 1
fi

if [[ "$OPTION" == "-v" ]]; then
grep -nrIi $WATCH_IMEI_PHONE . | sort | grep --color $WATCH_IMEI_PHONE
grep -nrIi $WATCH_IMEI_PHONE . | sort | grep --color $WATCH_IMEI_PHONE | wc -l
else
grep -nrIi $WATCH_IMEI_PHONE . | grep Devices | sort | grep --color $WATCH_IMEI_PHONE
grep -nrIi $WATCH_IMEI_PHONE . | grep Devices | sort | grep --color $WATCH_IMEI_PHONE | wc -l
fi
