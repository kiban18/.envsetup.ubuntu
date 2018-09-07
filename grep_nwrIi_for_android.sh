#!/bin/bash

#SEARCH="\"@string\/$1\""
SEARCH="\($1\)"

echo grep -nwrI --color ${SEARCH} .
grep -nwrI --color ${SEARCH} .
grep -nwrI --color ${SEARCH} . | wc
