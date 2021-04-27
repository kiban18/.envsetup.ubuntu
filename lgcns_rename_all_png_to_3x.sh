#!/bin/bash

#find . -iname "*.png"
find . -iname "*.png" -exec rename -v 's/\.png$/\@3x.png/i' {} \;
