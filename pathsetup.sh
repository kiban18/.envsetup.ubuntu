#!/bin/bash

# remove google3 JDK /usr/local/buildtools/java/jdk/bin from PATH on gLucid
PATH=${PATH/\/usr\/local\/buildtools\/java\/jdk\/bin:/}

PATH=$PATH:$envsetup
PATH=/usr/local/bin:$PATH

android_bin=~/tool/android/bin
if [[ "$android_bin" != "" ]]; then
    PATH=$android_bin:$PATH
fi

PS1="\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;32m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\e[0;32m\]\$ \[\e[m\]\[\e[0;32m\]"
if [[ `uname -a | grep rum` != "" ]]; then
    PS1="\[\e[0;31m\]\u@\h\[\e[m\] \[\e[1;31m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\e[0;31m\]\$ \[\e[m\]\[\e[0;31m\]"
fi

echo "    ~/.envsetup.$OS/pathsetup.sh sourced!!!"
