#!/bin/bash

RUM_SERVER=192.168.10.20

alias con='ssh -X kiban18@$RUM_SERVER'
alias mnt='ssh -X kiban18@$RUM_SERVER'

FROM=$1

if [ "${FROM}" == "mounted" ]; then
    SRCROOT=~rum/home/work/source
else
    SRCROOT=~work/source
fi

echo "    ~/.envsetup.$OS/rumsetup.sh sourced!!! : $SRCROOT"





cd googletv/android-4.2.2_r1
source ./build/envsetup.sh
lunch fox-eng
