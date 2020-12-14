#!/bin/bash

STOP="yes"

# 체크
OUTPUT=`git st`
if [[ ${OUTPUT} == *"커밋할 사항 없음, 작업 폴더 깨끗함"* ]]; then
    STOP="no"
fi

if [[ ${STOP} == "yes" ]]; then
    echo "check your local changes"
    git st
    exit
fi

echo "ready to go"

echo ""
git checkout mcircle
git pull
COMMIT_HASH_MCIRCLE=`git rev-parse HEAD`
echo "COMMIT_HASH_MCIRCLE: ${COMMIT_HASH_MCIRCLE}"

echo ""
git checkout master
git pull
COMMIT_HASH_CRAZYUP=`git rev-parse HEAD`
echo "COMMIT_HASH_CRAZYUP: ${COMMIT_HASH_CRAZYUP}"

if [[ ${COMMIT_HASH_CRAZYUP} == ${COMMIT_HASH_MCIRCLE} ]]; then
    echo ""
    echo "no difference between CRAZYUP and MCIRCLE"
    git lds
else
    git tree
fi
