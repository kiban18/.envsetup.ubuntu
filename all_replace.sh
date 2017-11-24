#!/bin/bash

FROM=$1
TO=$2

read -p "${FROM} --> ${TO}, Press [Enter] ..."

find . -type f \( ! -iname "tags" -or ! -iname "cscope.*" \) -exec sed -i "s/\<${FROM}\>/${TO}/g" {} \;
#find . -name .git -prune -o -name tags -prune -o -name 'cscope.*' -prune -type f -exec sed -i "s/\<${FROM}\>/${TO}/g" {} \;
