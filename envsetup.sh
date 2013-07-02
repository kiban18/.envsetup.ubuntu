#!/bin/bash

set -o vi

case $OSTYPE in
  darwin*) OS=macosx;;
  linux*)  OS=ubuntu;;
esac

envsetup=~/.envsetup.$OS

envsetup_sh=$envsetup/envsetup.sh
devsetup_sh=$envsetup/devsetup.sh
pathsetup_sh=$envsetup/pathsetup.sh
alias cdenvsetup='cd $envsetup'
alias source.envsetup='source $envsetup_sh'
alias source.devsetup='source $devsetup_sh'
alias source.pathsetup='source $pathsetup_sh'
alias vienvsetup='vim $envsetup_sh'
alias videvsetup='vim $devsetup_sh'
alias vipathsetup='vim $pathsetup_sh'

vimrc=$envsetup/.vimrc
gitconfig=$envsetup/.gitconfig
alias ln.vimrc='ln -s $vimrc .vimrc'
alias ln.gitconfig='ln -s $gitconfig .gitconfig'
alias vivimrc='vim $vimrc'
alias vigitconfig='vim $gitconfig'

alias e='exit'

alias ls='ls -G'
alias l='ls -l'
alias ll='ls -alh'
alias llr='ls -alRh'
alias cd..='cd ..'
alias df='df -H'
alias du.1='du -d 1 -h'
alias du.2='du -d 2 -h'
alias du.3='du -d 3 -h'
alias du.4='du -d 4 -h'
alias tree.1='tree -L 1'
alias tree.2='tree -L 2'
alias tree.3='tree -L 3'
alias tree.4='tree -L 4'
alias tree.1.size='tree -L 1 --si'
alias tree.2.size='tree -L 2 --si'
alias tree.3.size='tree -L 3 --si'
alias tree.4.size='tree -L 4 --si'

echo "    ~/.envsetup.$OS/envsetup.sh sourced!!!"
