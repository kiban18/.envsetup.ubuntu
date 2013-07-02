#!/bin/bash

if [ $HOSTNAME == "rum" ]; then
    echo "Not allowed in rum server!!"
    exit
fi

RUM_HOME=~/rum/home

NEED_TO_MOUNT=`mount | grep $RUM_HOME > /dev/null; echo $?`
if [ ${NEED_TO_MOUNT} -eq 1 ]; then
    echo "${RUM_HOME} is ready to mount."
    mount ${RUM_HOME}
else
    echo "${RUM_HOME} already mounted!!!"
fi

cd ${RUM_HOME}
#. ./gtv_v2.sh mounted
