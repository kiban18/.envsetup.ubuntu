#!/bin/bash

if [ $# -eq 0 ]
then
    echo "USAGE: $0 <KEYWORD>"
    exit 1
fi

KEYWORD=$1

grep -E --color=auto "$KEYWORD|$"
