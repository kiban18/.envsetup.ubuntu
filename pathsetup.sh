#!/bin/bash

# remove google3 JDK /usr/local/buildtools/java/jdk/bin from PATH on gLucid
PATH=${PATH/\/usr\/local\/buildtools\/java\/jdk\/bin:/}

PATH=$PATH:$envsetup
PATH=$PATH:$envsetup:$envsetup/gtv
PATH=/usr/local/bin:$PATH
PATH=$PATH:/home/k/download/global/global
PATH=$PATH:/home/k/download/global/gtags
PATH=/works/studies/rtos/S5PC100/SRC/Linux/GCC/4.3.1-eabi-armv6/usr/bin:$PATH
LD_LIBRARY_PATH=/works/studies/rtos/S5PC100/SRC/Linux/GCC/4.3.1-eabi-armv6/gmp/lib:/works/studies/rtos/S5PC100/SRC/Linux/GCC/4.3.1-eabi-armv6/mpfr/lib
export PATH LD_LIBRARY_PATH

android_bin=~/tools/android/bin
if [[ "$android_bin" != "" ]]; then
    PATH=$android_bin:$PATH
fi

eclipse_bin=~/tools/eclipse
if [[ "$eclipse_bin" != "" ]]; then
    PATH=$PATH:$eclipse_bin
fi

argouml_path=~/tool/freeware/argouml-0.34
if [[ "$argouml_path" != "" ]]; then
    PATH=$PATH:$argouml_path
fi

ecos_path=/opt/ecos/ecos-3.0/tools/bin
if [[ "$ecos_path" != "" ]]; then
    PATH=$PATH:$ecos_path
fi

arm_none_eabi_path=/home/k/works/rtos_study/tools/arm-2013.05/bin
if [[ "$arm_none_eabi_path" != "" ]]; then
    PATH=$PATH:$arm_none_eabi_path
fi


WHITE="\[\e[1;37m\]"
GREEN="\[\e[0;32m\]"
CYAN="\[\e[0;36m\]"
GRAY="\[\e[0;37m\]"
BLUE="\[\e[0;34m\]"
END="\[\e[m\]"
GIT_BRANCH="\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
GIT_BR_TAG='$(__git_ps1)'
#GIT_BR_TAG="\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '\1/')\" -e \"print (%x{git describe --tags 2> /dev/null}.split(%r{\n}).first || '').gsub(/\*/, '\1')\"\`"
#PS1="${GRAY}\u@\h${END} ${GREEN}\w${END} $GIT_BRANCH${BLUE}$ ${END}"
PS1="${GREEN}\w${END}${GIT_BR_TAG}${BLUE}$ ${END}"
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#PS1="${GRAY}\u@\h${END} ${GREEN}\w${END} $(__git_ps1 "(%s)")${BLUE}$ ${END}"

# show (git branch) only
#PS1="\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;32m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\e[0;32m\]\$ \[\e[m\]\[\e[0;32m\]"
# show (git branch / git tag) both
#PS1="\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;32m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '\1/')\" -e \"print (%x{git describe --tags 2> /dev/null}.split(%r{\n}).first || '').gsub(/\*/, '\1')\"\`\[\e[0;32m\]\$ \[\e[m\]\[\e[0;32m\]"

echo "    ~/.envsetup.$OS/pathsetup.sh sourced!!!"
