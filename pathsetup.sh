#!/bin/bash

# remove google3 JDK /usr/local/buildtools/java/jdk/bin from PATH on gLucid
PATH=${PATH/\/usr\/local\/buildtools\/java\/jdk\/bin:/}

PATH=/usr/local/bin:$PATH
PATH=$PATH:$envsetup
PATH=$PATH:$envsetup/scripts
PATH=$PATH:/home/k/download/global/global
PATH=$PATH:/home/k/download/global/gtags
PATH=/works/studies/rtos/S5PC100/SRC/Linux/GCC/4.3.1-eabi-armv6/usr/bin:$PATH
LD_LIBRARY_PATH=/works/studies/rtos/S5PC100/SRC/Linux/GCC/4.3.1-eabi-armv6/gmp/lib:/works/studies/rtos/S5PC100/SRC/Linux/GCC/4.3.1-eabi-armv6/mpfr/lib
export PATH LD_LIBRARY_PATH

pmd_bin=~/work/tool/pmd-bin-4.2.6/bin
if [[ "$pmd_bin" != "" ]]; then
    PATH=$pmd_bin:$PATH
fi

nsiqcppstyle_bin=~/work/tool/nsiqcppstyle_server_0.2.2.12
if [[ "$nsiqcppstyle_bin" != "" ]]; then
    PATH=$nsiqcppstyle_bin:$PATH
fi

nsiqcollector_bin=~/work/tool/nsiqcollector
if [[ "$nsiqcollector_bin" != "" ]]; then
    PATH=$nsiqcollector_bin:$PATH
fi

llvm_bin=/home/k/dev/llvm31_install/bin
if [[ "$llvm_bin" != "" ]]; then
    PATH=$llvm_bin:$PATH
fi

t32_bin=/opt/t32/bin/pc_linux64
if [[ "$t32_bin" != "" ]]; then
    PATH=$t32_bin:$PATH
fi

jdk8_bin=~/work/tool/jdk1.8.0_92/bin
if [[ "$jdk8_bin" != "" ]]; then
    PATH=$jdk8_bin:$PATH
fi

#jdk_bin=~/work/tool/jdk1.6.0_45/bin
#if [[ "$jdk_bin" != "" ]]; then
#    PATH=$jdk_bin:$PATH
#fi

android_studio=~/work/tool/android-studio/bin
if [[ "$android_studio" != "" ]]; then
    PATH=$android_studio:$PATH
fi

android_bin=~/work/tool/android/bin
if [[ "$android_bin" != "" ]]; then
    PATH=$android_bin:$PATH
fi

# adb, fastboot
android_platform_tools=~/work/tool/platform-tools
if [[ "$android_platform_tools" != "" ]]; then
    PATH=$android_platform_tools:$PATH
fi

# android
android_sdk_tools=~/work/tool/adt-bundle-linux-x86_64-20140702/sdk/tools
if [[ "$android_sdk_tools" != "" ]]; then
    PATH=$android_sdk_tools:$PATH
fi
android_sdk2_tools=~/work/tool/adt-bundle-linux-x86_64-20140321/sdk/tools
if [[ "$android_sdk2_tools" != "" ]]; then
    PATH=$android_sdk2_tools:$PATH
fi

# zipalign
android_sdk_build_tools=~/work/tool/adt-bundle-linux-x86_64-20140702/sdk/build-tools/android-4.4W
if [[ "$android_sdk_build_tools" != "" ]]; then
    PATH=$android_sdk_build_tools:$PATH
fi
android_sdk2_build_tools=~/work/tool/adt-bundle-linux-x86_64-20140321/sdk/build-tools/19.1.0
if [[ "$android_sdk2_build_tools" != "" ]]; then
    PATH=$android_sdk2_build_tools:$PATH
fi

eclipse_bin=~/work/tool/adt-bundle-linux-x86_64-20140702/eclipse
if [[ "$eclipse_bin" != "" ]]; then
    PATH=$PATH:$eclipse_bin
fi

argouml_path=~/work/tool/argouml-0.34
if [[ "$argouml_path" != "" ]]; then
    PATH=$PATH:$argouml_path
fi

ecos_path=/opt/ecos/ecos-3.0/tools/bin
if [[ "$ecos_path" != "" ]]; then
    PATH=$PATH:$ecos_path
fi

arm_eabi_path=~/work/tool/gcc/linux-x86/arm/arm-eabi-4.6/bin
if [[ "$arm_eabi_path" != "" ]]; then
    PATH=$PATH:$arm_eabi_path
fi

achro_gcc_path=/usr/local/arm/4.2.2-eabi/usr/bin
if [[ "$achro_gcc_path" != "" ]]; then
    PATH=$PATH:$achro_gcc_path
fi

arm_2009q3_path=~/work/tool/arm-2009q3/bin
if [[ "$arm_2009q3_path" != "" ]]; then
    PATH=$PATH:$arm_2009q3_path
fi

android_ndk_path=~/work/tool/android-ndk-r10
if [[ "$android_ndk_path" != "" ]]; then
    PATH=$PATH:$android_ndk_path
fi
android_ndk9_path=~/work/tool/android-ndk-r9d
if [[ "$android_ndk9_path" != "" ]]; then
    PATH=$PATH:$android_ndk9_path
fi

openssl_path=/usr/local/ssl/bin
if [[ "$openssl_path " != "" ]]; then
    PATH=$PATH:$openssl_path
fi

android_sdk_path=/work/Android/Sdk/tools/bin
if [[ "$android_sdk_path" != "" ]]; then
    PATH=$PATH:$android_sdk_path
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

PATH=~/bin:$PATH
PATH=$PATH:~/work/secureos/build
PATH=$PATH:/usr/lib/dart/bin
PATH=$PATH:/home/khlee/tool/flutter/bin
PATH=$PATH:/home/khlee/tool/android-ndk-r15c

echo "    ~/.envsetup.$OS/pathsetup.sh sourced!!!"
