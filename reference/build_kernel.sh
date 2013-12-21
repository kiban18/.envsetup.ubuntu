#!/bin/bash

TOP_DIR=$PWD
LOG_FILE=$TOP_DIR/make_kernel.log
ELF_FILE=$TOP_DIR/kernel/vmlinux

CLEAN=$1
ANSWER=


if [[ "$CLEAN" == "clean" ]]; then
    echo "Really want to clean? [y/N]"
    read ANSWER
fi

. ./arndale_envsetup.sh
if [[ "$ANSWER" == "y" ]]; then
    kernel_make distclean
    kernel_make arndale_android_defconfig
fi
kernel_make -j4 2>&1 | tee $LOG_FILE

ls -ahl $ELF_FILE
file $ELF_FILE
#cp $ELF_FILE ~/data/work_for_share/ref/arndale/kernel
#arm-none-linux-gnueabi-readelf -a $ELF_FILE | less
