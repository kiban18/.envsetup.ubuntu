#!/bin/bash

#find . -iname "*.png"
#find . -iname "*@2x.png"
time find . -iname "*@2x.png" | xargs -L1 -I{} convert -resize 67% "{}" "{}"
