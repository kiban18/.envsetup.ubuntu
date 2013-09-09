#!/bin/bash

# remove google3 JDK /usr/local/buildtools/java/jdk/bin from PATH on gLucid
PATH=${PATH/\/usr\/local\/buildtools\/java\/jdk\/bin:/}

PATH=$PATH:$envsetup
PATH=$PATH:$envsetup:$envsetup/gtv
PATH=/usr/local/bin:$PATH
PATH=/works/studies/rtos/S5PC100/SRC/Linux/GCC/4.3.1-eabi-armv6/usr/bin:$PATH
LD_LIBRARY_PATH=/works/studies/rtos/S5PC100/SRC/Linux/GCC/4.3.1-eabi-armv6/gmp/lib:/works/studies/rtos/S5PC100/SRC/Linux/GCC/4.3.1-eabi-armv6/mpfr/lib
export PATH LD_LIBRARY_PATH

android_bin=~/tool/android/bin
if [[ "$android_bin" != "" ]]; then
    PATH=$android_bin:$PATH
fi

eclipse_bin=~/tool/android/adt-bundle/eclipse
if [[ "$eclipse_bin" != "" ]]; then
    PATH=$PATH:$eclipse_bin
fi

argouml_path=~/tool/freeware/argouml-0.34
if [[ "$argouml_path" != "" ]]; then
    PATH=$PATH:$argouml_path
fi


PS1="\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;32m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\e[0;32m\]\$ \[\e[m\]\[\e[0;32m\]"
if [[ `uname -a | grep rum` != "" ]]; then
    PS1="\[\e[0;31m\]\u@\h\[\e[m\] \[\e[1;31m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\e[0;31m\]\$ \[\e[m\]\[\e[0;31m\]"
fi

echo "    ~/.envsetup.$OS/pathsetup.sh sourced!!!"
