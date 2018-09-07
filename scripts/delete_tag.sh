#!/bin/bash

TAG_NAME=$1
if [[ "$TAG_NAME" == "" ]]; then
  echo "Usage : $0 <TAG_NAME>"
  echo "You can use one of the existing tags below..."
  echo ""
  git tag -l
  exit 1
fi

git tag -l | grep -nw $TAG_NAME
if [[ $? == 1 ]]; then
  echo "There is no \"$TAG_NAME\" tag."
  echo "Try again with one of the existing tags below..."
  echo ""
  git tag -l
  exit 1
fi

echo ""
echo "Really want to delete \"$TAG_NAME\" tag? [y/N]"
read ANSWER

if [[ "$ANSWER" == "y" ]]; then
  git tag -d $TAG_NAME
  git push origin :refs/tags/$TAG_NAME
  exit 0
fi

echo "\"$TAG_NAME\" tag is not deleted."
exit 0
