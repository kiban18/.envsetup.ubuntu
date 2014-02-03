#!/bin/bash

set -o vi

case $OSTYPE in
  darwin*) OS=macosx;;
  linux*)  OS=ubuntu;;
esac

envsetup=~/.envsetup.$OS
alias cdenvsetup='cd $envsetup'

envsetup_sh=$envsetup/envsetup.sh
devsetup_sh=$envsetup/devsetup.sh
pathsetup_sh=$envsetup/pathsetup.sh
alias source.envsetup='source $envsetup_sh'
alias source.devsetup='source $devsetup_sh'
alias source.pathsetup='source $pathsetup_sh'
alias vienvsetup='vim $envsetup_sh'
alias videvsetup='vim $devsetup_sh'
alias vipathsetup='vim $pathsetup_sh'

gitconfig=$envsetup/_gitconfig
profile=$envsetup/_profile
vimrc=$envsetup/_vimrc
alias vigitconfig='vim $gitconfig'
alias viprofile='vim $profile'
alias vivimrc='vim $vimrc'

#@@ ConqueTerm logcat
alias ctlogcat='while vim -c ":ConqueTerm adb_logcat.sh" -c ":set syntax=logcat"; do echo Restarting...; done'
#alias ctlogcat='while vim -c ":/.*kiban18.*" -c ":ConqueTerm adb_logcat.sh" -c ":set syntax=logcat"; do echo Restarting...; done'

#@@ ConqueTerm logcat
alias ctlogcat.kiban18='while vim -c ":ConqueTerm adb_logcat_kiban18" -c ":set syntax=logcat"; do echo Restarting...; done'

#@@ ConqueTerm socat
alias ctsocat='while vim -c ":ConqueTerm socat stdin /dev/ttyUSB0"; do echo Restarting...; done'
#alias ctsocat='while vim -c ":ConqueTerm socat stdin /dev/ttyUSB0" -c ":set syntax=dtv"; do echo Restarting...; done'

#@@ ConqueTerm bash
alias vash='while vim -c ":ConqueTerm bash" -c ":set syntax=logcat"; do echo Restarting...; done'

#@@ auto completion for global - by kiban18
funcs()
{
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=(`global -c $cur`)
}
complete -F funcs global

alias e='exit'

alias grep='grep --exclude=GTAGS --exclude=tags --exclude=cscope.* --exclude=*.map --exclude=*.p --color=auto'
alias ls='ls --color=auto -G'
alias l='ls --color=auto -l'
alias ll='ls --color=auto -alh'
alias llr='ls --color=auto -alRh'
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
