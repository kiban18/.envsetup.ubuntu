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

llvm_bin=/home/k/dev/llvm31_install/bin
if [[ "$llvm_bin" != "" ]]; then
    PATH=$llvm_bin:$PATH
fi

t32_bin=/opt/t32/bin/pc_linux64
if [[ "$t32_bin" != "" ]]; then
    PATH=$t32_bin:$PATH
fi

jdk_bin=~/tool/jdk1.6.0_45/bin
if [[ "$jdk_bin" != "" ]]; then
    PATH=$jdk_bin:$PATH
fi

android_bin=~/tool/android/bin
if [[ "$android_bin" != "" ]]; then
    PATH=$android_bin:$PATH
fi

android_platform_tools=~/tool/android/adt-bundle/sdk/platform-tools
if [[ "$android_platform_tools" != "" ]]; then
    PATH=$android_platform_tools:$PATH
fi

android_tools=~/tool/android/adt-bundle/sdk/tools
if [[ "$android_tools" != "" ]]; then
    PATH=$android_tools:$PATH
fi

eclipse_bin=~/tool/android/adt-bundle/eclipse
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

arm_eabi_path=~/tool/gcc/linux-x86/arm/arm-eabi-4.6/bin
if [[ "$arm_eabi_path" != "" ]]; then
    PATH=$PATH:$arm_eabi_path
fi

arm_2009q3_path=~/tool/gcc/arm-2009q3/bin
if [[ "$arm_2009q3_path" != "" ]]; then
    PATH=$PATH:$arm_2009q3_path
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
