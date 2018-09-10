#!/bin/bash

GUARDIAN_PHONE=$1
OPTION=$2
if [[ "$GUARDIAN_PHONE" == "" ]]; then
  echo "Usage : $0 <GUARDIAN_PHONE> -v"
  echo "    ex) $0 0123456789"
  exit 1
fi

if [[ "$OPTION" == "-v" ]]; then
    grep -nrIi "$GUARDIAN_PHONE" . | sort | grep --color "$GUARDIAN_PHONE"
    grep -nrIi "$GUARDIAN_PHONE" . | sort | grep --color "$GUARDIAN_PHONE" | wc -l
else
    grep -nrIi "$GUARDIAN_PHONE" . | grep Users | sort | grep --color "$GUARDIAN_PHONE"
    grep -nrIi "$GUARDIAN_PHONE" . | grep Users | sort | grep --color "$GUARDIAN_PHONE" | wc -l
fi
