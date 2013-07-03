#!/bin/bash

pushd ~

case $OSTYPE in
    darwin*) OS=macosx;;
    linux*)  OS=ubuntu;;
esac

echo "  [DEBUG] OS:$OS HOSTNAME:$HOSTNAME PWD:$PWD"

if [ -f .profile ]; then
    cat .profile > .profile.bak
    rm .profile
fi
ln -s .envsetup.$OS/_profile .profile
echo "    refresh .profile"

if [ -f .vimrc ]; then
    cat .vimrc > .vimrc.bak
    rm .vimrc
fi
ln -s .envsetup.$OS/_vimrc .vimrc
echo "    refresh .vimrc"

if [ -f .gitconfig ]; then
    mv .gitconfig .gitconfig.bak
fi
cp .envsetup.$OS/_gitconfig .gitconfig
echo "    refresh .gitconfig"

popd
