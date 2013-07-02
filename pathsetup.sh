#!/bin/bash

# remove google3 JDK /usr/local/buildtools/java/jdk/bin from PATH on gLucid
PATH=${PATH/\/usr\/local\/buildtools\/java\/jdk\/bin:/}

if [[ "$TOOL_MOUNTED" != "" ]]; then
#    PATH=$TOOL_MOUNTED/jdk1.6.0_33/bin:$PATH
    PATH=$PATH:$TOOL_MOUNTED/android-adt/adt-bundle-linux-x86_64-20130219/sdk/platform-tools
    PATH=$PATH:$TOOL_MOUNTED/android-adt/adt-bundle-linux-x86_64-20130219/sdk/tools
    PATH=$PATH:$TOOL_MOUNTED/android-ndk/android-ndk-r8d
    PATH=$PATH:$TOOL_MOUNTED/android-adt/adt-bundle-linux-x86_64-20130219/eclipse
    PATH=$PATH:$TOOL_MOUNTED/argouml/argouml-0.34
fi

if [[ "$ENVSETUP" != "" ]]; then
    PATH=$PATH:$ENVSETUP:$ENVSETUP/bin
fi

if [[ "$GITCORPDIR" != "" ]]; then
    PATH=$PATH:$GITCORPDIR/prebuilt/linux-x86_64/toolchain/arm-unknown-linux-gnueabi-4.5.3-glibc/bin
fi

PS1="\[\e[0;32m\]\u@\h\[\e[m\] \[\e[1;32m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\e[0;32m\]\$ \[\e[m\]\[\e[0;32m\]"
if [[ `uname -a | grep rum` != "" ]]; then
    PS1="\[\e[0;31m\]\u@\h\[\e[m\] \[\e[1;31m\]\w\[\e[m\] \`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\e[0;31m\]\$ \[\e[m\]\[\e[0;31m\]"
fi

echo ~/.envsetup.$OS/pathsetup.sh sourced!!!
