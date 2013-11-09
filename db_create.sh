#!/bin/bash

rm -rf tags
rm -rf cscope.*
rm -rf GPATH GRTAGS GTAGS


ctags -R

find . \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.s' -o -name '*.S' \) -print > cscope.files
cscope -b -i cscope.files

gtags
