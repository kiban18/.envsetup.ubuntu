#!/bin/bash

# Signal 2 is Ctrl+C
#trap "echo Ctrl+C was pressed" 2

IMAGE=$1
if [[ "${IMAGE}" == "" ]]; then
	echo "Usage : $0 <IMAGE_NAME>"
	echo "    ex) $0 zImage"
	echo "    ex) $0 zImage gdb"
	exit 1
fi

GDB=$2
if [[ "${GDB}" == "gdb" ]]; then
	DEBUG="-s -S"
fi

QEMU=qemu-system-arm
MACHINE="-M versatilepb"
MEMORY="-m 128M"
DISPLAY=-nographic
KERNEL="-kernel ${IMAGE}"

echo ${QEMU} ${MACHINE} ${MEMORY} ${DISPLAY} ${DEBUG} ${KERNEL}
