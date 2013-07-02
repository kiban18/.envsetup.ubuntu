#!/bin/bash

pushd ~

echo "PWD:$PWD for debug"

case $OSTYPE in
    darwin*) OS=macosx;;
    linux*)  OS=ubuntu;;
esac

echo "OS:$OS for debug"

if [ -f .profile ]; then
    mv .profile .profile.bak
fi
ln -s .envsetup.$OS/_profile .profile
echo "refresh .profile"

if [ -f .vimrc ]; then
    mv .vimrc .vimrc.bak
fi
ln -s .envsetup.$OS/_vimrc .vimrc
echo "refresh .vimrc"

if [ -f .gitconfig ]; then
    mv .gitconfig .gitconfig.bak
fi
cp .envsetup.$OS/_gitconfig .gitconfig
echo "refresh .gitconfig"

popd
