#!/bin/bash

FROM=$1
TO=$2

read -p "${FROM} --> ${TO}, Press [Enter] ..."

find . -type f -exec sed -i "s/\<${FROM}\>/${TO}/g" {} \;