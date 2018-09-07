#!/bin/bash

REALPATH=`realpath $0`
echo $REALPATH
TARGET_DIR=`dirname ${REALPATH}`
echo $TARGET_DIR
source ${TARGET_DIR}/project.sh.include

BRANCH_NAME=`git symbolic-ref --short HEAD`
echo "BRANCH_NAME: $BRANCH_NAME"
VERSION=`date +%Y%m%d_%H%M`
echo "VERSION: $VERSION"
TAG_NAME=${PROJECT_NAME}_${BRANCH_NAME}_${VERSION}
echo "TAG_NAME: $TAG_NAME"

RELEASE_DIR=../../release

echo ""
echo "Below command will be used to tag:"
echo "    git tag -a \"${TAG_NAME}\" -m \"${TAG_NAME} Release\" && git push --tags"
echo ""
echo "Really want to add \"${TAG_NAME}\" tag on \"${BRANCH_NAME}\" branch? [y/N]"
read ANSWER

if [[ "${ANSWER}" == "y" ]]; then
    git tag -a ${TAG_NAME} -m "${TAG_NAME} Release" && git push --tags
    mkdir -p ${RELEASE_DIR}
    git archive ${BRANCH_NAME} --prefix=`basename ${PWD}`/ | gzip > ${RELEASE_DIR}/`git describe ${BRANCH_NAME}`.tar.gz
    exit 0
fi

echo "\"${TAG_NAME}\" tag is not created on \"${BRANCH_NAME}\" branch."

exit 1
