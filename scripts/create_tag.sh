#!/bin/bash

REALPATH=`realpath $0`
echo $REALPATH
TARGET_DIR=`dirname ${REALPATH}`
echo $TARGET_DIR
source ${TARGET_DIR}/project.sh.include
if [[ $? != 0 ]]; then
    echo "NG: No project.sh.include file"
    exit 1
fi

VERSION=`cat "$VERSION_FILE" | tr "\n" " " | sed "s/$VERSION_HEAD//" | sed "s/$VERSION_TAIL//"`
echo "VERSION: $VERSION"
if [[ $VERSION == "" ]]; then
    echo "NG: VERSION is empty"
    exit 1
fi

BRANCH=`git symbolic-ref --short HEAD`
echo "BRANCH: $BRANCH"
if [[ $BRANCH == "" ]]; then
    echo "NG: BRANCH is empty"
    exit 1
fi

echo ""
echo "Below command will be used to tag:"
echo "    git tag -a \"$BRANCH-$VERSION\" -m \"$BRANCH-$VERSION Release\" && git push --tags"
echo ""
echo "Really want to add \"$BRANCH-$VERSION\" tag on \"$BRANCH\" branch? [y/N]"
read ANSWER

if [[ "$ANSWER" == "y" ]]; then
    git tag -a "$BRANCH-$VERSION" -m "$BRANCH-$VERSION Release" && git push --tags
    exit 0
fi

echo "\"$BRANCH-$VERSION\" tag is not created on \"$BRANCH\" branch."

exit 0
