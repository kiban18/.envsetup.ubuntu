#!/bin/bash

DEBUG=true
#DEBUG=false

CSCOPE_FILES=cscope.files
CSCOPE_IN_OUT=cscope.in.out
CSCOPE_OUT=cscope.out
CSCOPE_PO_OUT=cscope.po.out

rm -rf $CSCOPE_FILES $CSCOPE_IN_OUT $CSCOPE_OUT $CSCOPE_PO_OUT
find . \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' -o -name '*.java' \) -print > $CSCOPE_FILES
cscope -b -q

exit 0
