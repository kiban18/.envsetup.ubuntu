#!/bin/bash

FROM=$1
TO=$2

#read -p "${FROM} --> ${TO}, Press [Enter] ..."

time find . -type f -exec sed -i "s/\<${FROM}\>/${TO}/g" {} \;
#db_create.sh
#find . -type f \( ! -iname "tags" -or ! -iname "cscope.*" \) -exec sed -i "s/\<${FROM}\>/${TO}/g" {} \;
