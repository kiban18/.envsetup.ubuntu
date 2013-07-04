#!/bin/bash

DEBUG=true
#DEBUG=false

CTAGS_DB=tags

rm -rf $CSCOPE_DB
ctags -B -F -R --exclude="^out"

exit 0
