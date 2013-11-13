#!/bin/bash

# Signal 2 is Ctrl+C
#trap "echo Ctrl+C was pressed" 2

IMAGE=$1
if [[ "${IMAGE}" == "" ]]; then
	echo "Usage : make && $0 <IMAGE_NAME>"
	echo "        make && $0 rtos.img"
	echo "        make && $0 rtos.img gdb"
	exit 1
fi

GDB=$2
if [[ "${GDB}" == "gdb" ]]; then
	DEBUG="-s -S"
fi

QEMU=qemu-system-arm
#MACHINE="-M vexpress-a9"
MACHINE="-M versatilepb"
MEMORY="-m 128M"
DISPLAY=-nographic
KERNEL="-kernel ${IMAGE}"

echo ${QEMU} ${MACHINE} ${MEMORY} ${DISPLAY} ${DEBUG} ${KERNEL} 2>&1 | tee run.log
${QEMU} ${MACHINE} ${MEMORY} ${DISPLAY} ${DEBUG} ${KERNEL} 2>&1 | tee run.log
