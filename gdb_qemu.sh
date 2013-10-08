#!/bin/bash

# Signal 2 is Ctrl+C
#trap "echo Ctrl+C was pressed" 2

arm-none-eabi-gdb -iex \'set auto-load safe-path .\'
