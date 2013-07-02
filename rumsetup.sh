#!/bin/bash

RUM_SERVER=192.168.10.20

alias con='ssh -X kiban18@$RUM_SERVER'
alias mnt='ssh -X kiban18@$RUM_SERVER'

FROM=$1

if [ ${FROM} == "mounted" ]; then
    SRCROOT=~rum/home/work/source
else
    SRCROOT=~work/source
fi

echo "SRCROOT : $SRCROOT"
