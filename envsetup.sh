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
alias source.all='source.envsetup; source.devsetup; source.pathsetup'
alias vienvsetup='vim $envsetup_sh'
alias videvsetup='vim $devsetup_sh'
alias vipathsetup='vim $pathsetup_sh'

devsetup_hp_sh=$envsetup/devsetup.hp.sh
alias source.hp='source $devsetup_hp_sh'
devsetup_a5_sh=$envsetup/devsetup.a5.sh
alias source.a5='source $devsetup_a5_sh'
devsetup_a10_sh=$envsetup/devsetup.a10.sh
alias source.a10='source $devsetup_a10_sh'

gitconfig=$envsetup/_gitconfig
profile=$envsetup/_profile
vimrc=$envsetup/_vimrc
alias vigitconfig='vim $gitconfig'
alias viprofile='vim $profile'
alias vivimrc='vim $vimrc'

#@@ ConqueTerm logcat
alias ctlogcat='while vim -c ":ConqueTerm adb_logcat_usb.sh" -c ":set syntax=logcat"; do echo Restarting...; done'
#alias ctlogcat='while vim -c ":/.*kiban18.*" -c ":ConqueTerm adb_logcat_usb.sh" -c ":set syntax=logcat"; do echo Restarting...; done'

#@@ ConqueTerm logcat
alias ctlogcat.kiban18='while vim -c ":ConqueTerm adb_logcat_kiban18" -c ":set syntax=logcat"; do echo Restarting...; done'

#@@ ConqueTerm socat
alias ctsocat='while vim -c ":ConqueTerm socat stdin /dev/ttyUSB0,raw,echo=0,nonblock,min=0,b115200"; do echo Restarting...; done'
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

alias grep='grep --exclude=merger.xml --exclude=GTAGS --exclude=tags --exclude=cscope.* --exclude=*.map --exclude=*.p --color=auto'
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
alias ivim='vim'
alias vmi='vim'

alias tail.syslog='tail -f /var/log/syslog'

alias x='xsel --clipboard'
alias pwdx='pwd | x'
alias cdx='cd `x`'
alias vix='vi `x`'
alias cdstudy='cd ~/study/iamrootN/linux-4.1-rc4'

alias db='db_create.sh'
alias testlog='./make_result.sh | tee test.log'
alias testgrep='tail -f ./test.log | grep "\(TEST.*\|RUN\|OK\|FAILED\)"'
alias minicomlog='minicom | tee minicom.log'
alias minicomgrep='tail -f ./minicom.log | grep "\(RUN\|OK\|FAILED\|Dram Remain Size\|iRam used size\)"'

alias ssh.redmine='ssh redmine@192.168.100.254'
alias ssh.redmine.test='ssh redmine@192.168.100.253'


JOBLIST_FILE=~/.joblist
func_joblist() {
    touch $JOBLIST_FILE
    LAST_PUSHED_ITEM=`head -n 1 $JOBLIST_FILE`
    if [ "$LAST_PUSHED_ITEM" == "" ]; then
        echo "there is no job!"
    else
        cat $JOBLIST_FILE
    fi
}
alias job?='func_joblist'
func_jobpush() {
    if [ "$#" != 0 ]; then
        #sed -i -e '1i$*\' $JOBLIST_FILE
        #echo $* >> $JOBLIST_FILE
        { echo -e "$*"; cat $JOBLIST_FILE; } > $JOBLIST_FILE.new
            mv $JOBLIST_FILE{.new,}
        echo "new job [$*] is inserted!"
        echo ""
        job?
    fi
}
alias job+='func_jobpush'
func_jobpop() {
    LAST_PUSHED_ITEM=`head -n 1 $JOBLIST_FILE`
    sed -i "1d" $JOBLIST_FILE
    if [ "$LAST_PUSHED_ITEM" == "" ]; then
        echo "no job to drop!"
    else
        echo "[$LAST_PUSHED_ITEM] is dropped!"
        echo ""
        job?
    fi
}
alias job-='func_jobpop'
alias jobclear='rm -rf $JOBLIST_FILE; touch $JOBLIST_FILE'


export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER=`whoami`
    source $THEME
fi

echo "    ~/.envsetup.$OS/envsetup.sh sourced!!!"
