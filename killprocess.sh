#!/bin/bash

DEBUG=true

PROCESS=$1
if [[ "${PROCESS}" == "" ]]; then
	echo "Usage : $0 <PROCESS>"
	echo "    ex) $0 qemu-system-arm"
	exit 1
fi

if [[ "${DEBUG}" == "true" ]]; then
	echo ""
	echo ps aux | grep ${PROCESS}
	ps aux | grep ${PROCESS}
	echo "ps aux | grep ${PROCESS} | awk '{print $$2}'"
	ps aux | grep ${PROCESS} | awk '{print $2}'
	echo "ps aux | grep ${PROCESS} | awk '{print $$2}' | xargs sudo kill -9 "
	ps aux | grep ${PROCESS} | awk '{print $2}' | xargs sudo kill -9
fi

exit 0
