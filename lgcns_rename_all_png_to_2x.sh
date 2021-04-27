#!/bin/bash

#find . -iname "*.png"
#find . -iname "*[^@][^3][^x].png"
find . -iname "*[^@][^3][^x].png" -exec rename -v 's/\.png$/\@2x.png/i' {} \;
