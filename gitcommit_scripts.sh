#!/bin/bash

INCLUDE_PUSH=$1

git add scripts
git commit -m "move all version script into envsetup"

if [[ $INCLUDE_PUSH == "" ]]; then
    exit 0
fi

exit 0
